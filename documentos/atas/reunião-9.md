# Reunião #9

Data: 23/05/2019,
com: Bruno e Prof. Vladimir

## Contexto

Na última reunião o professor pediu para eu levantar os requisitos do Protótipo e modelar a arquitetura dele.

## Pontos Importantes

Apresentei a descrição do protótipo ao professor. Descrevi a lógica dos casos de uso.

O Prof. pontuou que talvez o escopo do protótipo esteja muito grande, e iniciou a descrição de um produto mínimo a ser construído para a próxima reunião.

Esse código deve estar operante em 2 ou 3 semanas.

## Código

### cliente 1 java

1. paciente publica prontuário
      - cliente java pede chaves para o servidor (servidor envia resultado de keygen)
      - (enviando params por post)

2. servidor devolve keygen

3. ~~cliente java solicita ao servidor a criptografia~~. **cliente realiza criptografia ABE e envia prontuário**
    - (enviando params por post)

4. ~~servidor devolve o arquivo encript~~. **Servidor devolve o caminho para o arquivo**

5. cliente java envia na blockchain via smart contract o endereço do prontuário

6. ~~cliente java envia para o servidor o o arquivo pdf e o arquivo teste encriptado.~~ **O arquivo já foi enviado em 3. O cliente envia somente o teste encriptado**

## blockchain

O Blockchain será um mock

### Classes do Smart Contract

a linguagem usada para descrever as classes é java, para aproveitar a formatação de código. A sintaxe apresentada não é uma sintaxe de Smart Contract, seja para Ethereum ou Hyperledger.

```java
class Container {
    Paciente patients[];

    public addPatient(Address patient);
    public getPatient(Address patient);
}
```

```java
class Paciente {
    Prontuário prontuários[];
    String nome;
    String email;

    addProntuário(Prontuario p);
    getProntuários();
}
```

```java
class Prontuario {
    String url;
    String código;
}
```

## Cliente 2 java

7. cliente 2 java pede na blockchain via smart contract
    - container.obterPaciente() returns Paciente

8. cliente 2 java lê prontuários[rand] e pede pro servidor o arquivo, enviando código como post

9. servidor devolve o arquivo teste

10. cliente 2 java vai decifrar teste e envia o hash via post ao servidor

11. servidor verifica o hash enviado, e devolve o arquivo pdf encriptado

11. cliente 2 java decifra o arquivo pdf
