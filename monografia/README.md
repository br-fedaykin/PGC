# Monografia do PGC

## Andamento do PGC

### 1. Introdução

#### 1.1 Objetivo Geral

#### 1.2 Objetivos Específicos

#### 1.3 Justificativa

### 2. Fundamentação Teórica

#### 2.1 Criptografia baseada em atributos

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
- [ ] algoritmo de consenso
  - [ ] necessidade
  - [ ] funcionamento
  - [ ] figura
- [ ] PoW, PoS
  - [ ] figura

#### 2.3 Contratos Inteligentes no Ethereum

- [ ] origem da ideia por Szabo
- [ ] utilidade, benefícios
- [ ] introdução à implementação no Ethereum
  - [ ] o que é EVM
  - [ ] o que é Solidity
  - [ ] exemplo de Smart Contract

### 3. Sistema Proposto

- [ ] primeira revisão e melhoria de redação
- [ ] incluir na descrição do servidor que ele implementa política criptográfica Zero-Knowledge <https://en.wikipedia.org/wiki/Non-interactive_zero-knowledge_proof>, <https://medium.com/iryo-network/why-now-is-the-right-time-to-deploy-zero-knowledge-encryption-9bd26c5be4ca>
- [ ] Figura dos principais componentes em alto nível

#### 3.1 Visão Geral

- [x] Descrever aqui ou na Seção 3.3 que o módulo DCPABE gera atributos que são uma estrutura contendo um nome e dois campos de bytes, entre 138 e 142, que codificam elementos de um Grupo de pareamento gerado pela biblioteca X do java (pesquisar quem gera isso).
- [x] primeira revisão e melhoria de redação

#### 3.2 Taxonomia das permissões

- [ ] primeira revisão e melhoria de redação

#### 3.3 Contratos inteligentes com CBA

- [x] Explicação do SmartDCPABEAuthority
- [x] Explicação do SmartDCPABEKeys
- [x] Explicação do SmartDCPABEFiles
- [x] Explicação do SmartDCPABERequests
- [x] Explicação do SmartDCPABEUsers
- [ ] primeira revisão e melhoria de redação

#### 3.4 Arquitetura Blockchain

- [ ] figura simples que mostrando cliente, servidor, e a Blockchain interligados.
- [ ] Descrição do cliente
  - [ ] corrigir erro `Package inputenc: Invalid UTF-8 byte sequence.` na palavra "código", próximo à [L658](./main.tex#L658)
