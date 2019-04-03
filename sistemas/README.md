# Sistemas com códigos publicados que usam ABE

## Sistemas testados

Autor | linguagem | Artigos citados | disponibilizado em | andamento | dependências
|---| ---| ---| ---| --- | --- |
|[sagrawal87](https://github.com/sagrawal87/ABE)| Python |[FAME: Fast Attribute-based Message Encryption](https://eprint.iacr.org/2017/807.pdf), [Ciphertext-Policy Attribute-Based Encryption](https://doi.org/10.1109/SP.2007.11),  [Improved Dual System ABE in Prime-Order Groups via Predicate Encodings](http://eprint.iacr.org/2015/409)| ago/2017 | 3 commits, todos em ago/2017 | Charm 0.43. Funciona com o branch dev, commit [40f2671](https://github.com/JHUISI/charm/commit/40f2671d6233ea669d1e2fab90531623993baf2b)

O projeto contém um arquivo [main.py](sagrawal87-python-ABE/main.py) que demonstra uma prova de conceito de criptografia utilizando Charm. Ele utiliza principalmente os submódulos  [```charm.toolbox.pairinggroup```](https://github.com/JHUISI/charm/blob/dev/charm/toolbox/pairinggroup.py) e [```charm.toolbox.ABEnc```](https://github.com/JHUISI/charm/blob/dev/charm/toolbox/ABEnc.py). Infelizmente, não existe um método implementado para converter uma mensagem nos parâmetros necessários para a execução da criptografia por pareamento de grupos. Isso inviabiliza o uso.

Autor | linguagem | Artigos citados | disponibilizado em | andamento | dependências
|---| ---| ---| ---| --- | --- |
[sibichakkaravarthy](https://github.com/sibichakkaravarthy/Attribute-based-and-identity-based) | Python | não há fontes | mar/2016 | 4 commits, todos em mar/2016 | Charm 0.43. Funciona com o branch dev, commit [40f2671](https://github.com/JHUISI/charm/commit/40f2671d6233ea669d1e2fab90531623993baf2b)

Segui a orientação do criador da biblioteca, executando [ServerMain.py](sibichakkaravarthy-python-ABE-IBE/ServerMain.py) e [MultiClient.py](sibichakkaravarthy-python-ABE-IBE/MultiClient.py), que parecem realizar alguma negociação para criar uma conexão segura. Isso envolve a troca de hashings, mas não vi o uso de ABE ou IBE. Há outros arquivos no repositório que usam a biblioteca charm, mas não sei como usá-los, pois não há orientação. Alguns deles parecem usar de fato ABE. **Há também um método de codificação de mensagens que pode ser útil se funcionar. Não o testei**.