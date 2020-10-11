#!/usr/bin/env python
#-*- coding: utf-8 -*-

import json
import csv

taxonomia = None
BASIC_TEX_FILE =  r"""
\begin{{itemize}}
{content}
\end{{itemize}}
"""
BASIC_NODE_LINE = r'{spaces}\item {content};'

def acrescentarFamília():
    global taxonomia

    csv_file = open('TISS/CBO2002_Familia.csv', 'r', encoding='utf-8-sig')
    reader = csv.DictReader(csv_file, delimiter=';')
    cbo_família = {}
    for line in reader:
        cbo_família[str(line['Código'])] = line['Título']
    csv_file.close()
    for nível in taxonomia['taxonomia']:
        nível['famílias'] = {}
        for grupo in nível['grupos']:
            códigoFamílias = set([x['código CBO'][:4] for x in grupo['profissões'] if x['código CBO'][:4] != ''])
            for código in códigoFamílias:
                descrição = cbo_família[código]
                if nível['famílias'].get(descrição) == None:
                    familia = {'código CBO': código}
                    familia['descrição'] = descrição
                    familia['profissões'] = []
                    nível['famílias'][descrição] = familia
                for profissão in grupo['profissões']:
                    if código in profissão['código CBO']:
                        nível['famílias'][descrição]['profissões'].append(profissão)
            for profissão in grupo['profissões']:
                if profissão['código CBO'] == '':
                    if nível['famílias'].get('sem CBO') == None:
                        nível['famílias']['sem CBO'] = {'código CBO' : 'sem CBO', 'profissões': []}
                    nível['famílias']['sem CBO']['profissões'].append(profissão)
        del(nível['grupos'])
        for código in nível['famílias']:
            família = nível['famílias'][código]
            família['total'] = sum([x['total'] for x in família['profissões']])

def renderTaxonomyAsTex():
    last_element = 't'
    indent = True
    level = 1
    tex_lines = []
    for (i, nível) in enumerate(taxonomia['taxonomia'], start=1):
        name = 'n{:02}'.format(i)
        line = BASIC_NODE_LINE.format(spaces=' '*2*level, content=nível['nível de especialização'])
        tex_lines.append(line)
        last_element = name
        indent = True
        tex_lines.append(r'{}\begin{{itemize}}'.format(' '*2*level))
        level += 1
        for (j, família) in  enumerate(nível['famílias'], start=1):
            subname = name + '_f{:02}'.format(j)
            content = '{} : {}'.format(nível['famílias'][família]['código CBO'], família)
            line = BASIC_NODE_LINE.format(spaces=' '*2*level, content=content)
            tex_lines.append(line)
            last_element = subname
            tex_lines.append(r'{}\begin{{itemize}}'.format(' '*2*level))
            level += 1
            for (k, profissão) in enumerate(nível['famílias'][família]['profissões']):
                content = '{} : {}'.format(profissão['código CBO'], profissão['profissão'].replace('&', r'\&'))
                line = BASIC_NODE_LINE.format(spaces=' '*2*level, content=content)
                tex_lines.append(line)
            else:
                level -= 1
                tex_lines.append(r'{}\end{{itemize}}'.format(' '*2*level))
            if indent:
                indent = False
        else:
            level -= 1
            tex_lines.append(r'{}\end{{itemize}}'.format(' '*2*level))
    return BASIC_TEX_FILE.format(content='\n'.join(tex_lines))

    return BASIC_NODE_LINE.format()

def main():
    global taxonomia
    with open('taxonomia_grupos.json', 'r', encoding='utf-8') as json_file:
        taxonomia = json.load(json_file)

    acrescentarFamília()
    with open('taxonomia_famílias.json', 'w+', encoding='utf-8') as taxonomy_file:
        json.dump(taxonomia, taxonomy_file, indent=4, ensure_ascii=False)
    tex_code = renderTaxonomyAsTex()
    with open('../monografia/taxonomia-profissões-completo.tex', 'w+', encoding='utf-8') as tex_file:
        tex_file.write(tex_code)

if __name__ == "__main__":
    main()
