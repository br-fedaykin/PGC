# Reunião #1

Data: 07/03/19,
com: Bruno e Prof. Vladimir

## Pontos Importantes

Sobre o início dos trabalhos.

Com a suposição de que existem frameworks ou bibliotecas que fornecem a funcionalidade de ABE, podemos estudar o domínio de saúde aplicado ao tema do PGC. Estudar questões de representação dos profissionais da área médica em papéis.

Ontologias podem ajudar, se encontrarmos alguma. Há diversas ontologias que podem auxiliar o PGC, é necessário pesquisar o que existe nas bibliografias da área.

O Prof. lembrou que há um artigo trabalhando a representação de papéis de médicos em atendimento médico.

Eu questionei se essa ontologia seria universalizável, ou seja, se seria aplicável em um contexto diferente de onde a ontologia foi modelada. O Prof. disse que é suficiente que a ontologia tenha uma alta porcentagem de cobertura das possíveis funções hospitalares que interajam com um prontuário. Ele citou que poderíamos trabalhar com 50 papéis, se isso cobrisse 90%, 95% da área, já seria o bastante.

## Um roteiro preliminar para o PGC

1. Encontrar ontologias que fundamentem a modelagem de papéis, atributos e políticas de acesso;
2. (supondo que exista ontologia), existem ferramentas que implementam ABE?
3. (supondo que existam frameworks ou bibliotecas de ABE), como aplicar a ontologia da área da saúde ao ABE
4. (supondo que aplicou ontologia no ABE e deu certo), como que aplica isso no blockchain? Como smart contracts se encaixam nisso?

Há a possibilidade de implementar o projeto com código já existente.

- O Professor levantou uma dúvida sobre como revogar permissões registradas em blockchain. O blockchain é imutável, se for necessário um acesso temporário, como fazer isso?
- Se não for possível abordar revogações, já será contribuição suficiente ter criado uma ontologia na área da saúde e um esquema de criptografia ABE, colocando isso em um blockchain. Pode virar uma área de pesquisa a parte, e assim vai fugir ao escopo do PGC.

## Dúvidas a sanar

nosso ABE é "key-police" ou "ciphertext-policy"? rever [Akin2010](/referências/criptografia/Akin2010.md) e entender qual é. O Prof. acha que é a Key-police.

## Definição de fases

### entrega do PGC 1

- Ontologia ou taxonomia da área da saúde. Entender a diferença entre os termos para descrever o que exatamente eu irei entregar.
- Testes de implementações de ABE.
- Em paralelo, verificar se alguma implementação é viável de integrar a um blockchain, seja ethereum ou hyperledger.

### entrega do PGC 2

- trabalhar as implementações focadas no blockchain.
- redação da monografia.

### PGC 3

- apresentação do trabalho