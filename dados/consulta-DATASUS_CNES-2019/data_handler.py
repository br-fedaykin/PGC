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

taxonomia = {}

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

def construir_taxonomia():
    global taxonomia
    # CSV data extracted manually from DATASUS

    json_file = open('profissionais-saude.json', 'r', encoding='utf-8')
    profissões_categorias = json.load(json_file)
    json_file.close()

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
                profissão_['código CBO'] = ""
                especialidade['profissões'].append(profissão_)
            nível_escolaridade['áreas'].append(especialidade)
        níveis.append(nível_escolaridade)
    taxonomia['taxonomia'] = níveis

def acrescentarContagem():
    global taxonomia

    csv_file = open('profissionais-saúde-2019-geral.csv', 'r', encoding='utf-8-sig')
    profissões_contagem = csv.DictReader(csv_file, delimiter=';')

    for linha in profissões_contagem:
        ocupação = linha['Ocupações em geral'].strip()
        total = int(linha['Total'])
        for nível in taxonomia['taxonomia']:
            for área in nível['áreas']:
                if isSameText(ocupação, área['especialidade']):
                    área['total'] = total
                for profissão in área['profissões']:
                    if isSameText(ocupação, profissão['profissão']):
                        profissão['total'] = total
    csv_file.close()

def acrescentarCBO(filename):
    global taxonomia

    csv_file = open(filename, 'r', encoding='utf-8-sig')
    cbo = csv.DictReader(csv_file, delimiter=';')

    for linha in cbo:
        código_cbo = str(linha['Código do Termo'])
        ocupação = linha['Termo']
        for nível in taxonomia['taxonomia']:
            for área in nível['áreas']:
                for profissão in área['profissões']:
                    if isSameText(ocupação, profissão['profissão']):
                        profissão['código CBO'] = código_cbo
    csv_file.close()

if __name__ == "__main__":
    construir_taxonomia()
    acrescentarContagem()
    acrescentarCBO('../TISS/tabela24_CBO.csv')
    acrescentarCBO('../TISS/tabelaCBO_auxiliar.csv')

    with open('taxonomia.json', 'w+', encoding='utf-8') as taxonomy_file:
        json.dump(taxonomia, taxonomy_file, indent=4, ensure_ascii=False)
