#!/usr/bin/env python
#-*- coding: utf-8 -*-

import json
import csv

ACCENT_MAPPING = {
    'a':['a','à','á','ã','â'],
    'e':['e','é','ê'],
    'i':['i','í','î'],
    'o':['o','ó','õ','ô'],
    'u':['u','ú','û'],
    'c':['c', 'ç']
}
def isSameText(word, another_word):
    is_the_same = word.lower() == another_word
    if not is_the_same and len(word) == len(another_word):
        comparison = []
        for i in range(len(word)):
            letter = word[i].lower()
            another_letter = another_word[i].lower()
            if letter in ACCENT_MAPPING.keys():
                comparison.append(another_letter in ACCENT_MAPPING[letter])
            elif another_letter in ACCENT_MAPPING.keys():
                comparison.append(letter in ACCENT_MAPPING[another_letter])
            else:
                comparison.append(letter == another_letter)
        is_the_same = all(comparison)
    return is_the_same

def main():
    # CSV data extracted manually from DATASUS

    csv_file = open('profissionais-saúde-2019-geral.csv', 'r', encoding='utf-8-sig')
    profissões_contagem = csv.DictReader(csv_file, delimiter=';')

    json_file = open('profissionais-saude.json', 'r', encoding='utf-8')
    profissões_categorias = json.load(json_file)
    json_file.close()

    taxonomia = {}
    níveis =  []
    for escolaridade in profissões_categorias:
        nível_escolaridade = {}
        nível_escolaridade['nível de especialização'] = escolaridade
        nível_escolaridade['áreas'] = []
        for grupo in profissões_categorias[escolaridade]:
            especialidade = {}
            especialidade['especialidade'] = list(grupo.keys())[0]
            especialidade['total'] = 0
            especialidade['profissões'] = []
            for profissão in grupo[especialidade['especialidade']]:
                profissão_ = {}
                profissão_['profissão'] = profissão
                profissão_['total'] = 0
                especialidade['profissões'].append(profissão_)
            nível_escolaridade['áreas'].append(especialidade)
        níveis.append(nível_escolaridade)
    taxonomia['taxonomia'] = níveis
    for linha in profissões_contagem:
        ocupação = linha['Ocupações em geral'].strip()
        total = int(linha['Total'])
        for nível in taxonomia['taxonomia']:
            for área in nível['áreas']:
                if isSameText(ocupação, área['especialidade']):
                    área['total'] = total
                for profissão in área['profissões']:
                    if 'jurídico' in ocupação.lower() and 'jurídico' in profissão['profissão'].lower():
                        print('debug')
                    if isSameText(ocupação, profissão['profissão']):
                        profissão['total'] = total
    csv_file.close()

    with open('taxonomia.json', 'w+', encoding='utf-8') as taxonomy_file:
        json.dump(taxonomia, taxonomy_file, indent=4, ensure_ascii=False)

if __name__ == "__main__":
    main()
