# Reunião #8

Data: 23/05/2019,
com: Bruno e Prof. Vladimir

## Pontos Importantes

Apresentei os [diagramas criados para explicar o fluxo de dados no código DCPABE do stefano 81](../../sistemas/stefano81-dcpabe.md).

Informei também que li o artigo que fundamenta o código, e logo pretendo disponibilizar um fichamento dele no repositório.

Os testes de casos de uso do repositório do DCPABE estão concluídos, e a biblioteca funciona normalmente. A dúvida sobre a importância de informar um usuário nas fases de geração de chave e descriptografia foram esclarecidas. As chaves são derivadas a partir de um hash do usuário, e ao conjugar um usuário com chaves que não tenham sido geradas para ele mas que cumpram a política de acesso, pode-se até conseguir executar o método de descriptografia sem erros, porém com um resultado corrompido.

O professor havia passado um link de um [tutorial para criar um blockchain com Hyperledger Fabric e Java](https://medium.com/@aleksobol/explained-java-chaincode-in-hyperledger-fabric-fc63fccc84a3), e decidimos explorar o código durante a reunião, visto que não consegui desenvolver a atividade a parte. Exploramos a lógica, que parece girar em torno de [criar/conectar um canal com a blockchain em execução](https://github.com/alek-sobol/hyperledgerfabric-tutorial/blob/736ff6b973524f1b23e87678f75cd90b03d1d88b/java-chaincode/carmileage-tracking/src/test/java/tutorial/chaincode/CarMileageChaincodeTest.java#L125), e [fazer a invocação de funções publicadas nela](https://github.com/alek-sobol/hyperledgerfabric-tutorial/blob/736ff6b973524f1b23e87678f75cd90b03d1d88b/java-chaincode/carmileage-tracking/src/main/java/tutorial/chaincode/CarMileageChaincode.java#L36). Analisamos o fluxo de informação e possíveis pontos-chave para o entendimento do código e consequentemente, do funcionamento do Hyperledger.

Discutindo sobre como adaptar o tutorial para o objetivo do PGC, observei que as funções de descriptografia precisam ser executadas localmente (no cliente), para que a chave-privada do usuário não seja exposta à rede e nem aos nós da rede, a quem supostamente é removida a necessidade de confiança ao se trabalhar com blockchains.

O Prof. sugeriu um modelo onde o objeto Ciphertext, que no código do Stefano encapsula a política de criptografia, fosse separado do arquivo onde foi aplicado e fosse publicado na blockchain, integralmente ou somente seu endereço e hash para verificação de integridade. Caso o usuário conseguisse satisfazer a política de acesso, seria possível obter o endereço do arquivo relacionado em algum servidor disponível ao cliente. Desta forma, dificulta-se a tarefa de descriptografar um arquivo por um invasor que tenha o acesso indevido, uma vez que sequer estará claro qual a política de acesso associado ao documento em questão.

A ideia então é publicar as permissões de algum recurso. Permissões mais recentes sobrescrevem as anteriores, então um cliente conectado ao blockchain procuraria a última versão ou transação associada a um determinado recurso.

## Tarefas para a Próxima Reunião

- escrever casos de uso de como funcionaria a blockchain. Supondo que exista um blockchain funcionando, pode-se pegar o último estado do que foi publicado nele. Uma ideia de caso de uso é:
  - um paciente que envia algo ao blockchain. O que que ele vai enviar? o arquivo todo, alguma parte? uma referência a um recurso em um servidor?
  - um usuário deseja acessar o arquivo do paciente. Ele vai acessar por um client. Como ele vai acessar?
  - supondo que o arquivo tá no blockchain, como controlar (permitir/restringir) a descriptografia feita pelo usuário do lado do cliente?
  - O usuário teria que perguntar ao hyperledger algo para poder descriptografar. O que?
  - se publicar a estrutura de acesso na blockchain, pode-se condicionar o acesso ao arquivo ao ter as credenciais necessárias.

Publicando no Hyperledger, pode-se ter:

- um recurso contendo
  - id do arquivo / referência para que o cliente o identifique;
  - access structure;
  - endereço físico do arquivo, criptografado com uma chave presente no access structure.

- uma requisição de acesso de recurso contendo
  - id do recurso solicitado;
  - o endereço da origem da requisição / id do acessante.

Obs: encontrei um outro [tutorial para criar um blockchain com Hyperledger Fabric e Node.js](https://medium.com/@morbachrodrigo/criando-uma-rede-blockchain-com-hyperledger-fabric-e-node-js-4192c964e45a)