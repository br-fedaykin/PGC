#!/usr/bin/env python3
import itertools
import operator
import os
import re
import sys
from collections import Counter

FILEPATH = "monografia\main.tex"
TOKENS = [
    r'\begin{',
    r'\end{',
    r'\newpage',
    r'\tableofcontents',
    r'\listoffigures',
    r'\lstlistoflistings',
    r'\vfill',
    r'{\color{ForestGreen}',
    r'{\color{RoyalBlue}',
    r'% ', r'%% ', r'%%% '
    ]

# criado a partir de consulta em https://www.wordandphrase.info/port/
FREQUENT_WORDS = [
    'o',
    'de',
    'e',
    'em',
    'um',
    'que',
    'a',
    'ser',
    'que',
    'para',
    'não',
    'com',
    'por',
    'ter',
    'se',
    'seu',
    'eu',
    'o',
    'ele',
    'fazer',
    'mais',
    'este',
    'ou',
    'poder',
    'estar',
    'esse',
    'mas',
    'ir',
    'todo',
    'outro',
    'como',
    'meu',
    'muito',
    'dizer',
    'ano',
    'se',
    'isso',
    'ela',
    'também',
    'muito',
    'grande',
    'bom',
    'nós',
    'pessoa',
    'saber',
    'como',
    'sobre',
    'algum',
    'ver',
    'eles',
    'nosso',
    'ficar',
    'dia',
    'quando',
    'querer',
    'dever',
    'vida',
    'sem',
    'dar',
    'mesmo',
    'um',
    'ainda',
    'coisa',
    'porque',
    'bem',
    'tempo',
    'entre',
    'sempre',
    'passar',
    'dois',
    'novo',
    'aquele',
    'quem',
    'falar',
    'tudo',
    'onde',
    'vir',
    'deixar',
    'apenas',
    'primeiro',
    'uma',
    'aqui',
    'mundo',
    'qualquer',
    'trabalho',
    'país',
    'conseguir',
    'tu',
    'depois',
    'usar',
    'achar',
    'parte',
    'homem',
    'qual',
    'próprio',
    'chegar',
    'haver',
    'começar',
    'mesmo',
    'conhecer',
    'do',
    'da',
    'é',
    'à',
    'na',
    'no',
    'são',
    'sua',
    'ao',
    'pelo',
    'pela'
]

def removeHeader(lines):
    start = 0
    for i in range(len(lines)):
        if lines[i].startswith(r'\begin{document}'):
            start=i
            break
    return lines[i:]

def removeLatexCommandTokens(lines):
    for i in range(len(lines)):
        lines[i] = lines[i].strip()
        if any([lines[i].startswith(x) for x in TOKENS]):
            lines[i] = ""
        else:
            lines[i] = re.sub(r'\\.+?[{ ]', '', lines[i])
            lines[i] = re.sub(r'% .*$', '\n', lines[i])
            lines[i] = lines[i].replace('}', '')
            pass
    return [x for x in lines if not (x == '' or x == r'\n')]

def textToTokenArray(text):
    text = " ".join(text)
    text = re.sub(r"[:\.,;`'()\[\]]", '', text)
    return [x.lower() for x in text.split()]

def countWords(text):
    wordArray = textToTokenArray(text)
    num_words = len(wordArray)
    counter = Counter(wordArray)
    counting = {}
    for word in set(wordArray):
        if len(word) <= 20:
            if word not in FREQUENT_WORDS:
                if word[:-1] not in FREQUENT_WORDS:
                    counting[word] = (counter[word], (counter[word] + 0.0)/num_words)
    orderedCounting = {k: v for k, v in sorted(counting.items(), key=lambda item: item[1][0], reverse=True)}
    return orderedCounting

def printCounting(counting, n, print_acc_counting = False):
    items = iter(counting)
    title = 'palavra:\t\tfreq.\t' + '%'.rjust(4)
    frequency = [x[1] for x in counting.values()]
    acc_func = itertools.accumulate(frequency, operator.add)
    if print_acc_counting:
        title = title + '\t' + '% acc'.rjust(6)
    print(title)
    for i in range(n):
        k = next(items)
        if len(k) <= 7:
            tab = '\t\t\t'
        elif len(k) < 15:
            tab = '\t\t'
        base_str = '{}\t{}\t {:.2%}'
        args = [k.ljust(20), str(counting[k][0]).rjust(4), counting[k][1]]
        if print_acc_counting:
            base_str = base_str + '\t {:.2%}'
            args.append(next(acc_func))
        print(base_str.format(*args))

if __name__ == "__main__":
    file = open(FILEPATH, "r", encoding="UTF-8")
    lines = removeHeader(file.readlines())
    text = removeLatexCommandTokens(lines)
    words = textToTokenArray(text)
    counting = countWords(text)
    n = 10
    if len(sys.argv) == 2:
        n = int(sys.argv[1])
    printCounting(counting, n, print_acc_counting=True)
