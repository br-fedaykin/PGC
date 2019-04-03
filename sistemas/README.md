# Sistemas relacionados à ABE

## Sistemas testados

Autor | linguagem | Artigos citados | disponibilizado em | andamento | dependências
|---| ---| ---| ---| --- | --- |
|[sagrawal87](https://github.com/sagrawal87/ABE)| Python |[1], [2],  [3]| ago/2017 | 3 commits, todos em ago/2017 | Charm 0.43. Funciona com o branch dev, commit [40f2671](https://github.com/JHUISI/charm/commit/40f2671d6233ea669d1e2fab90531623993baf2b)

O projeto contém um arquivo [main.py](sagrawal87-python-ABE/main.py) que demonstra uma prova de conceito de criptografia utilizando Charm. Ele utiliza principalmente os submódulos  [```charm.toolbox.pairinggroup```](https://github.com/JHUISI/charm/blob/dev/charm/toolbox/pairinggroup.py) e [```charm.toolbox.ABEnc```](https://github.com/JHUISI/charm/blob/dev/charm/toolbox/ABEnc.py). Infelizmente, não existe um método implementado para converter uma mensagem nos parâmetros necessários para a execução da criptografia por pareamento de grupos. Isso inviabiliza o uso.

Autor | linguagem | Artigos citados | disponibilizado em | andamento | dependências
|---| ---| ---| ---| --- | --- |
[sibichakkaravarthy](https://github.com/sibichakkaravarthy/Attribute-based-and-identity-based) | Python | sem artigos | mar/2016 | 4 commits, todos em mar/2016 | Charm 0.43. Funciona com o branch dev, commit [40f2671](https://github.com/JHUISI/charm/commit/40f2671d6233ea669d1e2fab90531623993baf2b)

Segui a orientação do criador da biblioteca, executando [ServerMain.py](sibichakkaravarthy-python-ABE-IBE/ServerMain.py) e [MultiClient.py](sibichakkaravarthy-python-ABE-IBE/MultiClient.py), que parecem realizar alguma negociação para criar uma conexão segura. Isso envolve a troca de hashings, mas não vi o uso de ABE ou IBE. Há outros arquivos no repositório que usam a biblioteca charm, mas não sei como usá-los, pois não há orientação. Alguns deles parecem usar de fato ABE. **Há também um método de codificação de mensagens que pode ser útil se funcionar. Não o testei**.

## Sistemas encontrados mas não testados

Autor | linguagem | Artigos citados | disponibilizado em | andamento | dependências | tem instruções de uso
|---| ---| ---| ---| --- | --- | --- |
[codewithmilo](https://github.com/codewithmilo/abescheme) | Python, C | [4] | jan/2014 | 26 commits, último em fev/2018 | [Charm 0.42](https://github.com/codewithmilo/abescheme/tree/master/Charm/dist), [Django 1.6.1](https://github.com/django/django) | não
[junwei-wang](https://github.com/junwei-wang/cpabe) | Java | [5] | mar/2012 | 75 commits, último em mar/2018 | [jpbc-1.2.1](http://gas.dia.unisa.it/projects/jpbc/) | sim
[TU-Berlin-SNET](https://github.com/TU-Berlin-SNET/JCPABE) | Java | [5] | abr/2015 | 56 commits, último em abr/2016 | [jpbc-2.0.0](http://gas.dia.unisa.it/projects/jpbc/) | sim
[TU-Berlin-SNET](https://github.com/TU-Berlin-SNET/jTR-ABE) | Java | [6], [7] | set/2015 | 19 commits, último em dez/2018 | [jpbc-2.0.0](http://gas.dia.unisa.it/projects/jpbc/) | sim
[zlwen](https://github.com/zlwen/cpabe-java) | Java | sem artigos | nov/2014 | 27 commits, último em dez/2014 | [jpbc-2.0.0](http://gas.dia.unisa.it/projects/jpbc/) | não
[tengyifei](https://github.com/tengyifei/dcpabe-web) | Java, Javascript | sem artigos | jan/2014 | 3 commits, último em fev/2015 | [Google Web Toolkit](http://www.gwtproject.org/), jpbc (não cita versão)| não
[zeutro](https://github.com/zeutro/openabe) | C++ | não é acadêmico, é comercial | abr/2018 | 28 commits, último em mar/2019 | não há | sim, muita

## Artigos

1. [FAME: Fast Attribute-based Message Encryption][1]
2. [Ciphertext-Policy Attribute-Based Encryption][2]
3. [Improved Dual System ABE in Prime-Order Groups via Predicate Encodings][3]
4. [privateBook: Encrypting User Data withAttribute-Based Encryption Using PrivacyPolicies][4]
5. [Ciphertext-Policy Attribute-Based Encryption][5],[alternativo][6]
6. [Practical Attribute-Based Encryption: Traitor Tracing, Revocation, and Large Universe][7]
7. [A Framework and Compact Constructions for Non-monotonic Attribute-Based Encryption][8]

[1]: https://eprint.iacr.org/2017/807.pdf
[2]: https://doi.org/10.1109/SP.2007.11
[3]: http://eprint.iacr.org/2015/409
[4]: https://www.bc.edu/content/dam/files/schools/cas_sites/cs/pdf/academics/honors/14Watanabe.pdf
[5]: https://junwei.co/cpabe/
[6]: https://www.cs.utexas.edu/~bwaters/publications/papers/cp-abe.pdf
[7]: http://eprint.iacr.org/2014/616
[8]: https://eprint.iacr.org/2014/181