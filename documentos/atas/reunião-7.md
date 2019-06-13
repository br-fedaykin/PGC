# Reunião #7

Data: 16/05/2019,
com: Bruno e Prof. Vladimir

## Pontos Importantes

Nesta reunião, mostrei os testes que havia escrito. Houve muitas dificuldades em escrevê-los. Posteriormente, migrar do IDE Eclipse para o editor Visual Studio Code + integrações resolveu o atrito com a linguagem Java e aumentou bastante a produção.

O Prof. viu testes relacionados à criação de usuário e cifra de um arquivo obedecendo uma política de acesso. Aparentemente, a descriptografia funciona mesmo se um usuário utilize chaves que não foram emitidas para ele, o que parece um contrassenso, já que o nome do usuário é um parâmetro necessário aos mecanismos de criptografia.

O Prof. questionou sobre a possibilidade de separar a permissão de um arquivo criptografado do conteúdo cifrado. Isso tem a ver com ideias de como interligar ABE e blockchain.

## Próxima Reunião

- escrever mais testes. Verificar se realmente as conjunções e disjunções estão funcionado ao escrever fórmulas booleanas de acesso aos documentos;
- Criar diagrama de fluxo básico das funções de DCPABETool disponíveis para uso.
- testar java em hyperledger através [deste tutorial](https://medium.com/@aleksobol/explained-java-chaincode-in-hyperledger-fabric-fc63fccc84a3)
