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
- [x] utilidade, benefícios
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
- [x] descrever que o sistema possui X fases e elaborar cada uma

#### 3.2 Padronização dos atributos e políticas de acesso

- [x] dar liga ao texto que fala sobre a taxonomia
  - [x] citar fontes apropriadas
- [x] dar liga ao texto que fala sobre o diagrama
- [x] REVISAR COM CUIDADO SE O TEXTO NÃO ESTÁ CONFUNDINDO DIAGRAMA E TAXONOMIA
- [x] verificar o melhor lugar para este novo subcapítulo no texto
- [ ] adequar a figura dos diagramas de permissão

#### 3.3 Módulo Cliente

- [ ] passar figura da taxonomia a limpo. [Link do Diagrama](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggUkxcbkExW0NSTV0gLS0gaXJyZXN0cml0byA8YSBocmVmPVwiXCJodHRwOi8vYml0Lmx5L0PDs2RpZ2_DiXRpY2FNZWRpY2luYTIjYXJ0OTBcIlwiPkFydC4gOTAtLTwvYT4gLS0-ICBCW1Byb250dcOhcmlvXVxuQiAtLS18Y29udMOpbXwgQ1tkYWRvcyBzZW5zw612ZWlzXVxuQyAtLS18c8Ojb3wgQzFbZG9lbsOnYXMsIG1lZGljYW1lbnRvcyBvdSA8YnI-IHRyYXRhbWVudG9zIGVzdGlnbWF0aXphZG9zIDxicj4gc29jaWFsbWVudGVdXG5CIC0tLXxjb250w6ltfCBEW2RhZG9zIGNvbXVuc11cbkIgLS0tfGNvbnTDqW18IEVbZGFkb3MgZGFub3Nvc11cbkUgLS0tfHPDo298IEUxW2hpcMOzdGVzZXMvcHJvZ27Ds3N0aWNvcyBxdWUgPGJyPiBvIHBhY2llbnRlIHBvZGUgbsOjbyBzdXBvcnRhcl1cbkIgLS0tfGNvbnTDqW18IEZbYXRlc3RhZG8gZGUgw7NiaXRvXVxuQiAtLS18Y29udMOpbXwgR1tsYXVkbyBkZSDDs2JpdG9dXG5BMltQYWNpZW50ZV0gLS0gaXJyZXN0cml0bywgYSBtZW5vcyBxdWUgPGJyPiBjYXVzZSBkYW5vIDxhIGhyZWY9XCJcImh0dHA6Ly9iaXQubHkvQ8OzZGlnb8OJdGljYU1lZGljaW5hMiNhcnQzNFwiXCI-QXJ0LiAzNDwvYT4gLS0-ICBCW1Byb250dcOhcmlvXVxuQTNbUmVwcmVzZW50YW50ZSBMZWdhbF0gLS0gaXJyZXN0cml0byA8YSBocmVmPVwiXCJodHRwOi8vYml0Lmx5L0PDs2RpZ2_DiXRpY2FNZWRpY2luYTIjYXJ0MzRcIlwiPkFydC4gMzQuPC9hPi4gLS0-ICBCW1Byb250dcOhcmlvXVxuQTRbRmFtaWxpYXIgZGUgMcK6XSAtLSBpcnJlc3RyaXRvIDxhIGhyZWY9XCJcImh0dHA6Ly9iaXQubHkvMlQ4NWhWTVwiXCI-Q1JFTUVTUDwvYT4uIC0tPiAgRlxuQTQgLS0gaXJyZXN0cml0byBhcMOzcyBvIMOzYml0byA8YnI-PGEgaHJlZj1cIlwiaHR0cHM6Ly9nbG8uYm8vMlQyTDRSaVwiXCI-c2VndW5kbyBhIGp1c3Rpw6dhPC9hPiAtLT4gIEJcbkE0IC0tIGlycmVzdHJpdG8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS8yVDg1aFZNXCJcIj5DUkVNRVNQPC9hPiAtLT4gIEdcbkE1W1NlZ3VyYWRvcmFdIC0tIGlycmVzdHJpdG8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEyI2FydDc3XCJcIj5BcnQuIDc3Li48L2E-LiAtLT4gIEZcbkE1IC0tICBxdWFuZG8gYXV0b3JpemFkbyBwZWxvIDxicj4gcmVwcmVzZW50YW50ZSBsZWdhbCA8YnI-PGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEyI2FydDc3XCJcIj5BcnQuIDc3LjwvYT4gLS0-ICBHXG5BNltQZXJpdG9dIC0tIHF1YW5kbyA8YnI-IG5vbWVhZG8gPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEyI2FydDg5cDFcIlwiPiBwYXIuIDHCuiwgQXJ0LiA4OS48L2E-IC0tPiBCXG5BN1tQZXNxdWlzYWRvcl0gLS0gYXV0b3JpemFkbyBwZWxvIENvbWl0w6ogPGJyPiBkZSDDiXRpY2Egb3UgcGFjaWVudGUgLS0tIEJcbkE4W1RlcmNlaXJvc10gLS0gYXV0b3JpemFkbyBwZWxvIDxicj4gcGFjaWVudGUgPGEgaHJlZj1cIlwiaHR0cDovL2JpdC5seS9Dw7NkaWdvw4l0aWNhTWVkaWNpbmEyI2FydDg5XCJcIj4gcGFyLiAxwrosIEFydC4gODkuPC9hPiAtLT4gQ1xuQThbVGVyY2Vpcm9zXSAtLSBhdXRvcml6YWRvIHBlbG8gPGJyPiBwYWNpZW50ZSA8YSBocmVmPVwiXCJodHRwOi8vYml0Lmx5L0PDs2RpZ2_DiXRpY2FNZWRpY2luYTIjYXJ0ODlcIlwiPiBwYXIuIDHCuiwgQXJ0LiA4OS48L2E-IC0tPiBEIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQiLCJzZWN1cml0eUxldmVsIjoibG9vc2UiLCJ0aGVtZVZhcmlhYmxlcyI6eyJiYWNrZ3JvdW5kIjoid2hpdGUiLCJwcmltYXJ5Q29sb3IiOiIjRUNFQ0ZGIiwic2Vjb25kYXJ5Q29sb3IiOiIjZmZmZmRlIiwidGVydGlhcnlDb2xvciI6ImhzbCg4MCwgMTAwJSwgOTYuMjc0NTA5ODAzOSUpIiwicHJpbWFyeUJvcmRlckNvbG9yIjoiaHNsKDI0MCwgNjAlLCA4Ni4yNzQ1MDk4MDM5JSkiLCJzZWNvbmRhcnlCb3JkZXJDb2xvciI6ImhzbCg2MCwgNjAlLCA4My41Mjk0MTE3NjQ3JSkiLCJ0ZXJ0aWFyeUJvcmRlckNvbG9yIjoiaHNsKDgwLCA2MCUsIDg2LjI3NDUwOTgwMzklKSIsInByaW1hcnlUZXh0Q29sb3IiOiIjMTMxMzAwIiwic2Vjb25kYXJ5VGV4dENvbG9yIjoiIzAwMDAyMSIsInRlcnRpYXJ5VGV4dENvbG9yIjoicmdiKDkuNTAwMDAwMDAwMSwgOS41MDAwMDAwMDAxLCA5LjUwMDAwMDAwMDEpIiwibGluZUNvbG9yIjoiIzMzMzMzMyIsInRleHRDb2xvciI6IiMzMzMiLCJtYWluQmtnIjoiI0VDRUNGRiIsInNlY29uZEJrZyI6IiNmZmZmZGUiLCJib3JkZXIxIjoiIzkzNzBEQiIsImJvcmRlcjIiOiIjYWFhYTMzIiwiYXJyb3doZWFkQ29sb3IiOiIjMzMzMzMzIiwiZm9udEZhbWlseSI6IlwidHJlYnVjaGV0IG1zXCIsIHZlcmRhbmEsIGFyaWFsIiwiZm9udFNpemUiOiIxNnB4IiwibGFiZWxCYWNrZ3JvdW5kIjoiI2U4ZThlOCIsIm5vZGVCa2ciOiIjRUNFQ0ZGIiwibm9kZUJvcmRlciI6IiM5MzcwREIiLCJjbHVzdGVyQmtnIjoiI2ZmZmZkZSIsImNsdXN0ZXJCb3JkZXIiOiIjYWFhYTMzIiwiZGVmYXVsdExpbmtDb2xvciI6IiMzMzMzMzMiLCJ0aXRsZUNvbG9yIjoiIzMzMyIsImVkZ2VMYWJlbEJhY2tncm91bmQiOiIjZThlOGU4IiwiYWN0b3JCb3JkZXIiOiJoc2woMjU5LjYyNjE2ODIyNDMsIDU5Ljc3NjUzNjMxMjglLCA4Ny45MDE5NjA3ODQzJSkiLCJhY3RvckJrZyI6IiNFQ0VDRkYiLCJhY3RvclRleHRDb2xvciI6ImJsYWNrIiwiYWN0b3JMaW5lQ29sb3IiOiJncmV5Iiwic2lnbmFsQ29sb3IiOiIjMzMzIiwic2lnbmFsVGV4dENvbG9yIjoiIzMzMyIsImxhYmVsQm94QmtnQ29sb3IiOiIjRUNFQ0ZGIiwibGFiZWxCb3hCb3JkZXJDb2xvciI6ImhzbCgyNTkuNjI2MTY4MjI0MywgNTkuNzc2NTM2MzEyOCUsIDg3LjkwMTk2MDc4NDMlKSIsImxhYmVsVGV4dENvbG9yIjoiYmxhY2siLCJsb29wVGV4dENvbG9yIjoiYmxhY2siLCJub3RlQm9yZGVyQ29sb3IiOiIjYWFhYTMzIiwibm90ZUJrZ0NvbG9yIjoiI2ZmZjVhZCIsIm5vdGVUZXh0Q29sb3IiOiJibGFjayIsImFjdGl2YXRpb25Cb3JkZXJDb2xvciI6IiM2NjYiLCJhY3RpdmF0aW9uQmtnQ29sb3IiOiIjZjRmNGY0Iiwic2VxdWVuY2VOdW1iZXJDb2xvciI6IndoaXRlIiwic2VjdGlvbkJrZ0NvbG9yIjoicmdiYSgxMDIsIDEwMiwgMjU1LCAwLjQ5KSIsImFsdFNlY3Rpb25Ca2dDb2xvciI6IndoaXRlIiwic2VjdGlvbkJrZ0NvbG9yMiI6IiNmZmY0MDAiLCJ0YXNrQm9yZGVyQ29sb3IiOiIjNTM0ZmJjIiwidGFza0JrZ0NvbG9yIjoiIzhhOTBkZCIsInRhc2tUZXh0TGlnaHRDb2xvciI6IndoaXRlIiwidGFza1RleHRDb2xvciI6IndoaXRlIiwidGFza1RleHREYXJrQ29sb3IiOiJibGFjayIsInRhc2tUZXh0T3V0c2lkZUNvbG9yIjoiYmxhY2siLCJ0YXNrVGV4dENsaWNrYWJsZUNvbG9yIjoiIzAwMzE2MyIsImFjdGl2ZVRhc2tCb3JkZXJDb2xvciI6IiM1MzRmYmMiLCJhY3RpdmVUYXNrQmtnQ29sb3IiOiIjYmZjN2ZmIiwiZ3JpZENvbG9yIjoibGlnaHRncmV5IiwiZG9uZVRhc2tCa2dDb2xvciI6ImxpZ2h0Z3JleSIsImRvbmVUYXNrQm9yZGVyQ29sb3IiOiJncmV5IiwiY3JpdEJvcmRlckNvbG9yIjoiI2ZmODg4OCIsImNyaXRCa2dDb2xvciI6InJlZCIsInRvZGF5TGluZUNvbG9yIjoicmVkIiwibGFiZWxDb2xvciI6ImJsYWNrIiwiZXJyb3JCa2dDb2xvciI6IiM1NTIyMjIiLCJlcnJvclRleHRDb2xvciI6IiM1NTIyMjIiLCJjbGFzc1RleHQiOiIjMTMxMzAwIiwiZmlsbFR5cGUwIjoiI0VDRUNGRiIsImZpbGxUeXBlMSI6IiNmZmZmZGUiLCJmaWxsVHlwZTIiOiJoc2woMzA0LCAxMDAlLCA5Ni4yNzQ1MDk4MDM5JSkiLCJmaWxsVHlwZTMiOiJoc2woMTI0LCAxMDAlLCA5My41Mjk0MTE3NjQ3JSkiLCJmaWxsVHlwZTQiOiJoc2woMTc2LCAxMDAlLCA5Ni4yNzQ1MDk4MDM5JSkiLCJmaWxsVHlwZTUiOiJoc2woLTQsIDEwMCUsIDkzLjUyOTQxMTc2NDclKSIsImZpbGxUeXBlNiI6ImhzbCg4LCAxMDAlLCA5Ni4yNzQ1MDk4MDM5JSkiLCJmaWxsVHlwZTciOiJoc2woMTg4LCAxMDAlLCA5My41Mjk0MTE3NjQ3JSkifX19). Ver se é viável usar a biblioteca TikZ
  - [ ] Incluir o MÉDICO na taxonomia com acesso irrestrito se ele for o responsável pelo paciente
- [x] primeira revisão e melhoria de redação
- [x] Usar aquela definição para o ataque onde alguém tentar ceder credenciais para alguém não autorizado.

#### 3.4 Módulo Blockchain

- [x] Explicação do SmartDCPABEAuthority
- [x] Explicação do SmartDCPABEKeys
- [x] Explicação do SmartDCPABEFiles
- [x] Explicação do SmartDCPABERequests
- [x] Explicação do SmartDCPABEUsers
- [x] primeira revisão e melhoria de redação
- [ ] figura simples que mostrando cliente, servidor, e a Blockchain interligados.
- [x] Descrição do cliente
  - [ ] corrigir erro `Package inputenc: Invalid UTF-8 byte sequence.` na palavra "código", próximo à [L658](./main.tex#L658)
- [x] Descrição do servidor
- [x] Descrição da rede Ethereum e ambiente de desenvolvimento
  - [x] Publicação dos contratos na testnet Rinkeby
  - [x] Verificação e adição de código fonte aos Smart Contracts na testnet Rinkeby
  - [x] Imagem de dependências dos Smart Contracts

#### 3.5 Módulo Servidor


### 4 Trabalhos relacionados

- [x] Texto introdutório
- [x] tabela de comparação de funcionalidades

#### 4.1 Sistemas na área de saúde usando Blockchain e ABE

- [x] Attribute-based Multi-Signature and Encryption for EHR Management: A Blockchain-based Solution
- [x] A Decentralizing Attribute-Based Signature for Healthcare Blockchain - IEEE Conference Publication
- [x] Securing e-health records using keyless signature infrastructure blockchain technology in the cloud
- [x] Medical Data Sharing Scheme Based on Attribute Cryptosystem and Blockchain Technology - IEEE Journals & Magazine
- [x] Toward Secure, Privacy-Preserving, and Interoperable Medical Data Sharing via Blockchain - IEEE Conference Publication
- [x] A Blockchain-based Approach to the Secure Sharing of Healthcare Data

#### 4.2 Sistemas na área de saúde com acesso online usando ABE

- [ ] An Efficient Framework for Health System Based on Hybrid Cloud with ABE-Outsourced Decryption | SpringerLink
- [ ] Scalable and Secure Sharing of Personal Health Records in Cloud Computing Using Attribute-Based Encryption - IEEE Journals & Magazine
- [ ] Securing electronic medical records using attribute-based encryption on mobile devices | Proceedings of the 1st ACM workshop on Security and privacy in smartphones and mobile devices

### 5 Resultados

- [ ] tabela listando todas as chaves utilizadas no sistema e uma breve explicação
- [ ] caso de uso básico
  - [ ] custo de gás para execução do caso de uso, por etapa
- [ ] análise do crescimento de custo de uma transação de publicação de um arquivo em relação ao tamanho da política de acesso
- [ ] tabela das funções implementadas na Blockchain com o custo em gas de cada uma e o custo em valor monetário em relação à cotação do Ethereum hoje e a 12 meses atrás.
- [ ] texto citando as restrições de trabalho que influenciaram a arquitetura atual. Por exemplo, falar de especificidades do Java e do Solidity/EVM que restringiram a quantidade de instruções em Smart Contracts.

### 6 conclusão e trabalhos futuros

- [ ] redação
- [ ] ~~estudar mecanismos de revocação no artigo Attribute-Based Encryption Optimized for Cloud Computing (2015)~~
- [ ] implementar mecanismo de revocação de atributos compatível com DCPABE descrito no paper "DACC Distributed Access Control in Clouds"
- [ ] implementar ZPK no servidor
- [ ] usar hyperledger Fabric / hyperledger Besu para diminuir gasto financeiro / problema energético do Ethereum (citar artigo Is bitcoin the only problem? A scenario model for the power demand of blockchains)

### Anexos
- [ ] Pesquisar sobre numeração própria para anexos em Latex
- [ ] Revisar e formatar Anexo I
- [ ] Anexo II - código dos Smart Contracts
