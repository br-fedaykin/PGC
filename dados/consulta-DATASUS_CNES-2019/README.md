
# Lista de Profissionais da Saúde no Brasil

[Link para a página de consulta](http://tabnet.datasus.gov.br/cgi/deftohtm.exe?cnes/cnv/prid02br.def)

## Observações dos dados extraídos na consulta no Portal da Saúde

1. CNES - Recursos Humanos - Profissionais - Indivíduos - segundo CBO 2002 - Brasil
2. Quantidade por Ocupações Administrativas e Tipo de Estabelecimento
3. Período:Jan/2019
4. Fonte: Ministério da Saúde - Cadastro Nacional dos Estabelecimentos de Saúde do Brasil - CNES
5. nota:
    A partir do processamento de junho de 2012, houve mudança na classificação da natureza e esfera dos estabelecimentos. Com isso, temos que:

        - Até maio de 2012 estas informações estão disponíveis como "Natureza" e "Esfera Administrativa".
        - De junho de 2012 a outubro de 2015, estão disponíveis tanto como "Natureza" e "Esfera Administrativa", como "Natureza Jurídica" e "Esfera Jurídica".
        - A partir de novembro de 2015, estão disponíveis como "Natureza Jurídica" e "Esfera Jurídica".

## Extração de dados

Os dados das categorias foram sistematizadas em um [arquivo json](profissionais-saude.json), com a seguinte estrutura:

```
{
    Nível de especialização:
    [
        {
            área de atuação:
            [
                especialidades
            ]
        }
    ]
}
```

### TODO: reestruturar profissionais-saude.json para o formato

```
[
    {
        "nível": "Nível de Especialização",
        "áreas" :
        [
            {
                "especialidade": "Nome da Especialidade",
                "profissões":
                [
                    profissões
                ]
            }
        ]
    }
]
```