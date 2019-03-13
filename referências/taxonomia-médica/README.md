# Categorização dos Profissionais da Saúde

## Artigo sobre taxonomia

1. An ontological knowledge framework for adaptive medical workflow, 2008.
   - Tem uma ontologia mostrando papeis médicos, e como ele se liga a uma ontologia de fluxo de trabalho de um hospital (p.5). As especialidades nesta ontologia se limitam a duas, e talvez possa ser estendida combinando-a com uma outra ontologia que encontrarmos.
   - não li todo o artigo, só chequei a figura contendo a ontologia.
   - [link do PDF](https://www.sciencedirect.com/science/article/pii/S1532046408000658)

## Sites contendo informações estruturais sobre a saúde

1. Crosswalk Medicare Provider/Supplier To Healthcare Provider Taxonomy:
   - Possui uma lista completa de fornecedores de serviço de saúde ligados ao Medicare, um programa de saúde dos EUA.
   - Dados em csv e json disponíveis em [dados](/dados/medicare).
   - [link da página](https://data.cms.gov/Medicare-Enrollment/CROSSWALK-MEDICARE-PROVIDER-SUPPLIER-to-HEALTHCARE/j75i-rw8y)

2. Tipos de especialidades em estabelecimentos [de Saúde] com especialidades e especializados:
   - Não consegui encontrar as fontes destas informações, para entender sua estrutura. Após pesquisas na internet, criei a hipótese que essa lista de categorias na área da saúde está relacionado com o [censo do IBGE sobre a situação da Assistência Médico-Sanitária (AMS)](https://www.ibge.gov.br/estatisticas-novoportal/sociais/saude/9067-pesquisa-de-assistencia-medico-sanitaria.html?=&t=o-que-e), realizadas em [2002](https://ww2.ibge.gov.br/home/estatistica/populacao/condicaodevida/ams/default.shtm), [2005](https://ww2.ibge.gov.br/home/estatistica/populacao/condicaodevida/ams/2005/default.shtm) e [2009](https://ww2.ibge.gov.br/home/estatistica/populacao/condicaodevida/ams/2009/default.shtm). Encontrei algumas referências a esta forma de organização no [relatório do IBGE sobre a AMS de 2002](https://biblioteca.ibge.gov.br/pt/biblioteca-catalogo?view=detalhes&id=21405), mas somente em parte.
   - [link da lista](http://tabnet.datasus.gov.br/cgi/ams/webhelp/tipos_de_especialidades.htm)

3. Profissionais da área da Saúde de acordo com o [Portal da Saúde]/[CNES]:
   - Uma lista completa de médicos, poderia dizer até uma taxonomia, já que as especialidades estão agrupadas de acordo com subclasses. Realizei pesquisas segmentadas de acordo com as categorias disponíveis para consulta, e salvei no repositório, em [dados](/dados/consulta-DATASUS_CNES-2019). Como esta lista contém dados quantitativos, podemos saber quais são as especialidades mais relevantes para uma primeira listagem de papéis a serem considerados no [ABE].
   - [link da página de consulta do DATASUS](http://tabnet.datasus.gov.br/cgi/deftohtm.exe?cnes/cnv/prid02br.def)

4. Profissionais da área da Saúde, de acordo com método de pesquisa do IBGE:
   - Essa lista é menor que a lista encontrada pesquisando as informações no Portal da Saúde. Ela pode ser considerada um recorte feito sobre aquela lista.
   - [Página da pesquisa](https://metadados.ibge.gov.br/consulta/estatisticos/operacoes-estatisticas/AM)
   - [Link do formulário em PDF](http://biblioteca.ibge.gov.br/visualizacao/instrumentos_de_coleta/doc2382.pdf) (profissionais nas p.8-9)

5. Tipos de estabelecimentos de Saúde no Brasil:
   - Fonte atrelada ao DATASUS, contém uma explicação dos tipos de estabelecimentos que compõem o sistema de saúde. A pesquisa por profissionais salva em já está separada por tipo de estabelecimento. Pode ter utilidade para delimitar qual ambiente de trabalho iremos escolher como pano de fundo para a modelagem, e justificar a escolha.
   - [link da lista](http://tabnet.datasus.gov.br/cgi/cnes/tipo_estabelecimento.htm)

[Portal da Saúde]: http://www2.datasus.gov.br/DATASUS/index.php?area=0204&id=11673
[ABE]: ../siglas.md#ABE
[CNES]: https://wiki.saude.gov.br/cnes/index.php/P%C3%A1gina_principal