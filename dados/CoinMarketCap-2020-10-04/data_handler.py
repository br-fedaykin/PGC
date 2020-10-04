#!/usr/bin/env python3

import json

def group_ids_for_query(json_obj, num_partitions = 8):
    ids = [str(x["id"]) for x in json_obj["data"]]
    partition_size = int(len(ids)/num_partitions)
    d = []
    for i in range(num_partitions):
        start = partition_size*i
        end = partition_size*(i + 1)
        # check for last chunk to round partitioning
        if (len(ids) - end < num_partitions):
            end = len(ids) - 1
        d.append(",".join(ids[start:end]))
    return d

def filter_coins_by_tags(json_obj, tags):
    coins = {}
    for id in json_obj['data']:
        if json_obj['data'][id].get('tags') != None:
            if all([t in json_obj['data'][id]['tags'] for t in tags]):
                coins[id] = json_obj['data'][id]
    return coins

def filter_coins_by_description(json_obj, expr, operand='include'):
    if operand == 'include':
        operand = lambda x : x
    elif operand == 'exclude':
        operand = lambda x : not x
    else:
        raise Exception('invalid operand: ' + operand)
    coins = {x:json_obj[x] for x in json_obj if operand(expr in json_obj[x]['description'])}
    return coins

def main():
    # queries from CoinMarketCap API were done using Postman and save as json files

    # gets active cryptocoins IDs
    obj_listing = None
    with open('active-coins-listing.json') as f:
        obj_listing = json.load(f)
        for id_group in group_ids_for_query(obj_listing):
            print(id_group)
        obj_listing['data'] = {str(x['id']):x for x in obj_listing['data']}

    # metadata json only has data of active projects listed in above step
    own_chain_sc_coins = None
    with open('active-coins-metadata.json') as f:
        all_coins = json.load(f)
        sc_coins = filter_coins_by_tags(all_coins, ['smart-contracts'])
        own_chain_sc_coins = filter_coins_by_description(sc_coins, ' and operates on the ', operand='exclude')
    for id in own_chain_sc_coins:
        own_chain_sc_coins[id] = {**own_chain_sc_coins[id], **obj_listing['data'][id]}
    with open('active-smart-contract-coins.json', 'w') as f:
        json.dump(own_chain_sc_coins, f, indent=4)
    print('\nThere are {} cryptocoins with native support of Smart Contracts.'.format(len(own_chain_sc_coins)))

if __name__ == "__main__":
    main()
