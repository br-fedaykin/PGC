#!/usr/bin/env python3
import itertools
import operator
import os
import re
import string
import sys
from collections import Counter

FILEPATH = "monografia\main.tex"

SYMBOLS = string.digits + string.punctuation

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

ACCENT_MAPPING = {
    'a':['a','à','á','ã','â'],
    'e':['e','é','ê'],
    'i':['i','í','î'],
    'o':['o','ó','õ','ô'],
    'u':['u','ú','û']
}

PLURAL_SUFIXES = [
    's',
    'm',
    'es',
    'os',
    'is',
    'ns',
    'eis',
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
    'pela',
    'dela',
    'dele',
    'essa',
    'esse',
    'seja'
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
    return text.split()

def removeMeaninglessWords(words):
    output = []
    for word in words:
        if not all([ch in SYMBOLS for ch in word]) and (len(word) > 3 or word.isupper()):
            if word.lower() not in FREQUENT_WORDS and word.lower()[:-1] not in FREQUENT_WORDS:
                output.append(word)
    return output

def joinPluralEntries(words):
    words = sorted(words, key=lambda x: len(x))
    output = {}
    while len(words) != 0:
        word = words.pop(0)
        similar_index = []
        key = None
        for i in range(len(words)):
            another_word = words[i]
            is_similar, difference = isSimilarWord(word, another_word)
            if difference is not None and key is None:
                key = "{}({})".format(word, difference)
            if is_similar:
                similar_index.append(i)
        similar_words = [words.pop(x) for x in reversed(similar_index)]
        if key is None:
            key = word
        output[key] = similar_words + [word]
    return output

def isSimilarWord(word, another_word):
    is_similar = word.lower() == another_word
    difference = None
    isAnyInitials = lambda x : any([y.replace('s','S').isupper() for y in x])
    total_diff = len(another_word) - len(word)
    if not isAnyInitials([word, another_word]) and 0 < total_diff <= 2:
        similarity = [isEquivalent(word[i], another_word[i]) for i in range(len(word))]
        if False in similarity:
            total_diff = total_diff + len(word) - similarity.index(False)
        if total_diff <= 3:
            plural_particle = another_word[len(another_word) - total_diff:]
            if plural_particle in PLURAL_SUFIXES:
                is_similar = True
                difference = plural_particle
    return (is_similar, difference)

def isEquivalent(letter, another_letter, ignore_accent = True):
    same_letter = letter.lower() == another_letter.lower()
    if ignore_accent and letter in ACCENT_MAPPING.keys():
        for variations in ACCENT_MAPPING.values():
            if letter in variations and another_letter in variations:
                same_letter = True
                break
    return same_letter

def countWords(wordArray):
    num_words = len(wordArray)
    counting = {}
    counter = Counter(wordArray)
    important_words = removeMeaninglessWords(list(set(wordArray)))
    unique_words = joinPluralEntries(important_words)
    for (word, variations) in unique_words.items():
        occurrences = sum([counter[x] for x in variations])
        counting[word] = (occurrences, (occurrences + 0.0)/num_words)
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
    counting = countWords(words)
    n = 10
    if len(sys.argv) == 2:
        n = int(sys.argv[1])
    printCounting(counting, n, print_acc_counting=True)
