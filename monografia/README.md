# Monografia do PGC

## Andamento do PGC

### 1. Introdução

#### 1.1 Objetivo Geral

#### 1.2 Objetivos Específicos

#### 1.3 Justificativa

### 2. Fundamentação Teórica

#### 2.1 Criptografia baseada em atributos

- [x] Explicar e fazer uma imagem explicando a derivação de atributos em um ambiente multi-autoridade, através do ID, que então gera uma chave mestra privada e uma chave pública, e várias outras chaves privadas particulares derivadas a partir da chave mestra e todas compatíveis com a mesma chave pública.
- [x] Explicar aqui que uma política de acesso deve ser escrito como uma fórmula booleana descrita em termos de atributos e operadores E e OU (ou seja, monotônica)
- [x] Explicar aqui que a política de acesso pode ser convertida em uma matriz que representa a estrutura de acesso de um LSSS (Linear Secret Sharing Scheme) e que isso torna o processo mais eficiente. É o que o artigo de criação do ABE prevê e é o que o esquema DCPABE aplica.

#### 2.2 Blockchain Ethereum

- [x] antes do Bitcoin
- [x] origens da Blockchain
- [x] Blockchain, bloco, transação, script, validação
  - [ ] converter imagem para tex
- [x] Blockchain 2.0 / Distributed Ledger
  - [ ] indicar no rodapé mais informações ou adicionar referências quanto a Smart Properties, Smart Contracts e DApps
  - [ ] citar aplicações financeiras
  - [ ] citar aplicações semi-financeiras
  - [ ] citar aplicações não financeiras
- [x] algoritmo de consenso
  - [x] necessidade
  - [x] funcionamento
  - [ ] figura
- [x] PoW
- [ ] PoS
  - [ ] figura

#### 2.3 Contratos Inteligentes no Ethereum

- [x] origem da ideia por Szabo
- [men ] utilidade, benefícios
- [x] introdução à implementação no Ethereum
  - [x] o que é EVM
  - [x] o que é Solidity
  - [x] exemplo de Smart Contract

### 3. Sistema Proposto

- [ ] primeira revisão e melhoria de redação
- [x] incluir na descrição do servidor que ele implementa política criptográfica Zero-Knowledge <https://en.wikipedia.org/wiki/Non-interactive_zero-knowledge_proof>, <https://medium.com/iryo-network/why-now-is-the-right-time-to-deploy-zero-knowledge-encryption-9bd26c5be4ca>
- [x] Figura dos principais componentes em alto nível

#### 3.1 Visão Geral

- [x] Descrever aqui ou na Seção 3.3 que o módulo DCPABE gera atributos que são uma estrutura contendo um nome e dois campos de bytes, entre 138 e 142, que codificam elementos de um Grupo de pareamento gerado pela biblioteca X do java (pesquisar quem gera isso).
- [x] primeira revisão e melhoria de redação
- [ ] imagem e texto declarando que se trabalha de forma híbrida com dados dentro e fora da Blockchain
- [ ] descrever que o sistema possui X fases e elaborar cada uma

#### 3.2 Taxonomia das permissões

- [ ] passar figura da taxonomia a limpo. [Link do Diagrama](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggUkxcbkExW0NSTV0gLS0gaXJyZXN0cml0byA8YSBocmVmPVwiXCJodHRwOi8vYml0Lmx5L0PDs2RpZ2_DiXRpY2FNZWRpY2luYSNhcnQ5MFwiXCI-QXJ0LiA5MC0tPC9hPiAtLT4gIEJbUHJvbnR1w6FyaW9dXG5CIC0tLXxjb250w6ltfCBDW2RhZG9zIHNlbnPDrXZlaXNdXG5DIC0tLXxzw6NvfCBDMVtkb2Vuw6dhcywgbWVkaWNhbWVudG9zIG91IDxicj4gdHJhdGFtZW50b3MgZXN0aWdtYXRpemFkb3MgPGJyPiBzb2NpYWxtZW50ZV1cbkIgLS0tfGNvbnTDqW18IERbZGFkb3MgY29tdW5zXVxuQiAtLS18Y29udMOpbXwgRVtkYWRvcyBkYW5vc29zXVxuRSAtLS18c8Ojb3wgRTFbaGlww7N0ZXNlcy9wcm9nbsOzc3RpY29zIHF1ZSA8YnI-IG8gcGFjaWVudGUgcG9kZSBuw6NvIHN1cG9ydGFyXVxuQiAtLS18Y29udMOpbXwgRlthdGVzdGFkbyBkZSDDs2JpdG9dXG5CIC0tLXxjb250w6ltfCBHW2xhdWRvIGRlIMOzYml0b11cbkEyW1BhY2llbnRlXSAtLSBpcnJlc3RyaXRvLCBhIG1lbm9zIHF1ZSA8YnI-IGNhdXNlIGRhbm8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEjYXJ0MzRcIlwiPkFydC4gMzQ8L2E-IC0tPiAgQltQcm9udHXDoXJpb11cbkEzW1JlcHJlc2VudGFudGUgTGVnYWxdIC0tIGlycmVzdHJpdG8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEjYXJ0MzRcIlwiPkFydC4gMzQuPC9hPi4gLS0-ICBCW1Byb250dcOhcmlvXVxuQTRbRmFtaWxpYXIgZGUgMcK6XSAtLSBpcnJlc3RyaXRvIDxhIGhyZWY9XCJcImh0dHA6Ly9iaXQubHkvMlQ4NWhWTVwiXCI-Q1JFTUVTUDwvYT4uIC0tPiAgRlxuQTQgLS0gaXJyZXN0cml0byBhcMOzcyBvIMOzYml0byA8YnI-PGEgaHJlZj1cIlwiaHR0cHM6Ly9nbG8uYm8vMlQyTDRSaVwiXCI-c2VndW5kbyBhIGp1c3Rpw6dhPC9hPiAtLT4gIEJcbkE0IC0tIGlycmVzdHJpdG8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS8yVDg1aFZNXCJcIj5DUkVNRVNQPC9hPiAtLT4gIEdcbkE1W1NlZ3VyYWRvcmFdIC0tIGlycmVzdHJpdG8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEjYXJ0NzdcIlwiPkFydC4gNzcuLjwvYT4uIC0tPiAgRlxuQTUgLS0gIHF1YW5kbyBhdXRvcml6YWRvIHBlbG8gPGJyPiByZXByZXNlbnRhbnRlIGxlZ2FsIDxicj48YSBocmVmPVwiXCJodHRwOi8vYml0Lmx5L0PDs2RpZ2_DiXRpY2FNZWRpY2luYSNhcnQ3N1wiXCI-QXJ0LiA3Ny48L2E-IC0tPiAgR1xuQTZbUGVyaXRvXSAtLSBxdWFuZG8gPGJyPiBub21lYWRvIDxhIGhyZWY9XCJcImh0dHA6Ly9iaXQubHkvQ8OzZGlnb8OJdGljYU1lZGljaW5hI2FydDg5cDFcIlwiPiAmIzE2NyAxwrosIEFydC4gODkuPC9hPiAtLT4gQlxuQTdbUGVzcXVpc2Fkb3JdIC0tIGF1dG9yaXphZG8gcGVsbyBDb21pdMOqIDxicj4gZGUgw4l0aWNhIG91IHBhY2llbnRlIC0tLSBCXG5BOFtUZXJjZWlyb3NdIC0tIGF1dG9yaXphZG8gcGVsbyA8YnI-IHBhY2llbnRlIDxhIGhyZWY9XCJcImh0dHA6Ly9iaXQubHkvQ8OzZGlnb8OJdGljYU1lZGljaW5hI2FydDg5XCJcIj4gJiMxNjcgMcK6LCBBcnQuIDg5LjwvYT4gLS0-IENcbkE4W1RlcmNlaXJvc10gLS0gYXV0b3JpemFkbyBwZWxvIDxicj4gcGFjaWVudGUgPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEjYXJ0ODlcIlwiPiAmIzE2NyAxwrosIEFydC4gODkuPC9hPiAtLT4gRCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0Iiwic2VjdXJpdHlMZXZlbCI6Imxvb3NlIn19). Ver se é viável usar a biblioteca TikZ
  - [ ] Incluir o MÉDICO na taxonomia com acesso irrestrito se ele for o responsável pelo paciente
- [x] primeira revisão e melhoria de redação
- [x] Usar aquela definição para o ataque onde alguém tentar ceder credenciais para alguém não autorizado.

#### 3.3 Contratos inteligentes com CBA

- [x] Explicação do SmartDCPABEAuthority
- [x] Explicação do SmartDCPABEKeys
- [x] Explicação do SmartDCPABEFiles
- [x] Explicação do SmartDCPABERequests
- [x] Explicação do SmartDCPABEUsers
- [ ] primeira revisão e melhoria de redação

#### 3.4 Arquitetura Blockchain

- [ ] figura simples que mostrando cliente, servidor, e a Blockchain interligados.
- [x] Descrição do cliente
  - [ ] corrigir erro `Package inputenc: Invalid UTF-8 byte sequence.` na palavra "código", próximo à [L658](./main.tex#L658)
- [x] Descrição do servidor
- [x] Descrição da rede Ethereum e ambiente de desenvolvimento
  - [x] Publicação dos contratos na testnet Rinkeby
  - [x] Verificação e adição de código fonte aos Smart Contracts na testnet Rinkeby
  - [x] Imagem de dependências dos Smart Contracts

### 4 Trabalhos relacionados

- [x] Texto introdutório
- [ ] tabela de comparação de funcionalidades

#### 4.1 Sistemas na área de saúde usando Blockchain e ABE

- [ ] Attribute-based Multi-Signature and Encryption for EHR Management: A Blockchain-based Solution
- [x] A Decentralizing Attribute-Based Signature for Healthcare Blockchain - IEEE Conference Publication
- [ ] Securing e-health records using keyless signature infrastructure blockchain technology in the cloud | SpringerLink
- [ ] Medical Data Sharing Scheme Based on Attribute Cryptosystem and Blockchain Technology - IEEE Journals & Magazine
- [ ] Toward Secure, Privacy-Preserving, and Interoperable Medical Data Sharing via Blockchain - IEEE Conference Publication

#### 4.2 Sistemas na área de saúde com acesso online usando ABE

- [ ] An Efficient Framework for Health System Based on Hybrid Cloud with ABE-Outsourced Decryption | SpringerLink
- [ ] Scalable and Secure Sharing of Personal Health Records in Cloud Computing Using Attribute-Based Encryption - IEEE Journals & Magazine
- [ ] Securing electronic medical records using attribute-based encryption on mobile devices | Proceedings of the 1st ACM workshop on Security and privacy in smartphones and mobile devices

### 5 Resultados

- [ ] tabela de chaves criptográficas do Sistema
- [ ] caso de uso
- [ ] gráficos e dados
