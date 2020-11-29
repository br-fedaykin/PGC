# TAXONOMIA DE PROFISSÕES NA ÁREA DA SAÚDE

Esta taxonomia foi montada a partir da junção de fontes de dados distintas, coletadas durante o trabalho.
Especificamente, foi utilizada a Classificação Brasileira de Ocupações para obtenção do código CBO, que é um código único associado a cada profissão pelo Ministério do Trabalho.
Fontes de dados disponibilizadas pelo DATASUS foram utilizadas para completar e atualizar a CBO em relação a possíveis profissões que estivessem ausentes, completando assim a lista de profissões.
Tanto a CBO quanto as fontes de consulta do DATASUS realizam categorizações destas profissões, entretanto estas são conflitantes.
A CBO define uma semântica a cada digito que compõem o código CBO, onde os dois últimos dígitos correspondem a ocupações, o quarto digito da esquerda para a direita corresponde a uma família, que é um conjunto de ocupações similares.
A fonte de consulta do DATASUS ignora esse conceito de família e realiza um agrupamento arbitrário e desbalanceado, em termos de quantidades de ocupações.

Fez parte deste trabalho mesclar as fontes de dados e apresentar uma taxonomia unificada da área da saúde.
A taxonomia foi construída seguindo as seguintes heurísticas, enumeradas em ordem de importância e aplicação na construção da taxonomia apresentada mais abaixo.

1. seguir a terminologia e codificação da CBO;
2. seguir a terminologia e codificação encontrada em fontes de consulta do DATASUS, caso a ocupação não conste na CBO;
3. seguir o agrupamento e especialização do DATASUS;
4. dentro de cada grupo de especialização, seguir as famílias de ocupações do CBO, caso se trate de ocupações na área da saúde;
5. dentro de cada grupo de especialização, tratar como uma família de ocupações a categorização feita pelo DATASUS, caso se tratem de ocupações fora da área da saúde;
6. manter, dentro de cada especialização, um grupo especial denominado como ``sem código CBO'' para descrever ocupações sem qualquer tipo de referência ou codificação.

A regra 1 permite que a taxonomia possua a maior quantidade possível de termos interoperáveis com outras bases de dados dependentes da CBO.
A regra 6 complementa a finalidade na regra 1 de conservar a interoperabilidade entre sistemas, na medida em que evita a criação ou derivação de códigos para as ocupações que não os tenham.
A regra 2 somente cobre os casos de termos e códigos ausentes na CBO.
As regras 3 a 5 não tratam das profissões em si mas de seus agrupamentos, e tentam unir os melhores aspectos da CBO e do DATASUS para produzir a taxonomia mais útil possível no escopo deste trabalho.

## Taxonomia das Famílias de Ocupações

- [PESSOAL DE SAÚDE - NÍVEL SUPERIOR](#pessoal-de-saúde---nível-superior)

  - [2251 : Médicos clínicos](#2251--médicos-clínicos)
  - [2516 : Assistentes sociais e economistas domésticos](#2516--assistentes-sociais-e-economistas-domésticos)
  - [2234 : Farmacêuticos](#2234--farmacêuticos)

  - [2252 : Médicos em especialidades cirúrgicas](#2252--médicos-em-especialidades-cirúrgicas)
  - [2231 : Médicos](#2231--médicos)
  - [2235 : Enfermeiros e afins](#2235--enfermeiros-e-afins)
  - [0000 : sem CBO](#0000--sem-cbo)
  - [2236 : Fisioterapeutas](#2236--fisioterapeutas)
  - [2238 : Fonoaudiólogos](#2238--fonoaudiólogos)
  - [2237 : Nutricionistas](#2237--nutricionistas)
  - [2232 : Cirurgiões-dentistas](#2232--cirurgiões-dentistas)
  - [2515 : Psicólogos e psicanalistas](#2515--psicólogos-e-psicanalistas)
  - [2253 : Médicos em medicina diagnóstica e terapêutica](#2253--médicos-em-medicina-diagnóstica-e-terapêutica)
  - [2000 : Outras ocupações de Nível Superior Relacionados à Saúde](#2000--outras-ocupações-de-nível-superior-relacionados-à-saúde)

- [PESSOAL DE SAÚDE - NÍVEL SUPERIOR](#pessoal-de-saúde---nível-superior)

  - [2251 : Médicos clínicos](#2251--médicos-clínicos)
  - [2516 : Assistentes sociais e economistas domésticos](#2516--assistentes-sociais-e-economistas-domésticos)
  - [2234 : Farmacêuticos](#2234--farmacêuticos)
  - [2252 : Médicos em especialidades cirúrgicas](#2252--médicos-em-especialidades-cirúrgicas)
  - [2231 : Médicos](#2231--médicos)
  - [2235 : Enfermeiros e afins](#2235--enfermeiros-e-afins)
  - [0000 : sem CBO](#0000--sem-cbo)
  - [2236 : Fisioterapeutas](#2236--fisioterapeutas)
  - [2238 : Fonoaudiólogos](#2238--fonoaudiólogos)
  - [2237 : Nutricionistas](#2237--nutricionistas)
  - [2232 : Cirurgiões-dentistas](#2232--cirurgiões-dentistas)
  - [2515 : Psicólogos e psicanalistas](#2515--psicólogos-e-psicanalistas)
  - [2253 : Médicos em medicina diagnóstica e terapêutica](#2253--médicos-em-medicina-diagnóstica-e-terapêutica)
  - [2000 : Outras ocupações de Nível Superior Relacionados à Saúde](#2000--outras-ocupações-de-nível-superior-relacionados-à-saúde)

- [PESSOAL DE SAÚDE - NÍVEL SUPERIOR](#pessoal-de-saúde---nível-superior)
  - [2251 : Médicos clínicos](#2251--médicos-clínicos)
  - [2516 : Assistentes sociais e economistas domésticos](#2516--assistentes-sociais-e-economistas-domésticos)
  - [2234 : Farmacêuticos](#2234--farmacêuticos)
  - [2252 : Médicos em especialidades cirúrgicas](#2252--médicos-em-especialidades-cirúrgicas)
  - [2231 : Médicos](#2231--médicos)
  - [2235 : Enfermeiros e afins](#2235--enfermeiros-e-afins)
  - [0000 : sem CBO](#0000--sem-cbo)
  - [2236 : Fisioterapeutas](#2236--fisioterapeutas)
  - [2238 : Fonoaudiólogos](#2238--fonoaudiólogos)
  - [2237 : Nutricionistas](#2237--nutricionistas)
  - [2232 : Cirurgiões-dentistas](#2232--cirurgiões-dentistas)
  - [2515 : Psicólogos e psicanalistas](#2515--psicólogos-e-psicanalistas)
  - [2253 : Médicos em medicina diagnóstica e terapêutica](#2253--médicos-em-medicina-diagnóstica-e-terapêutica)
  - [2000 : Outras ocupações de Nível Superior Relacionados à Saúde](#2000--outras-ocupações-de-nível-superior-relacionados-à-saúde)
- [PESSOAL DE SAÚDE - NÍVEL TÉCNICO TÉCNICO/AUXILIAR](#pessoal-de-saúde---nível-técnico-técnicoauxiliar)
    - [3222 : Técnicos e auxiliares de enfermagem](#3222--técnicos-e-auxiliares-de-enfermagem)
    - [5151 : Trabalhadores em serviços de promoção e apoio à saúde](#5151--trabalhadores-em-serviços-de-promoção-e-apoio-à-saúde)
    - [000000 : sem CBO](#000000--sem-cbo)
    - [3251 : Técnico em farmácia e em manipulação farmacêutica](#3251--técnico-em-farmácia-e-em-manipulação-farmacêutica)
    - [8103 : Supervisores de produção em indústrias de produtos farmacêuticos, cosméticos e afins](#8103--supervisores-de-produção-em-indústrias-de-produtos-farmacêuticos-cosméticos-e-afins)
    - [5152 : Auxiliares de laboratório da saúde](#5152--auxiliares-de-laboratório-da-saúde)
    - [3253 : Técnicos de apoio à biotecnologia](#3253--técnicos-de-apoio-à-biotecnologia)
    - [3242 : Técnicos de laboratórios de saúde e bancos de sangue](#3242--técnicos-de-laboratórios-de-saúde-e-bancos-de-sangue)
    - [2237 : Nutricionistas](#2237--nutricionistas-1)
    - [3225 : Técnicos em próteses ortopédicas](#3225--técnicos-em-próteses-ortopédicas)
    - [3135 : Técnicos em fotônica](#3135--técnicos-em-fotônica)
    - [3226 : Técnicos de imobilizações ortopédicas](#3226--técnicos-de-imobilizações-ortopédicas)
    - [3224 : Técnicos de odontologia](#3224--técnicos-de-odontologia)
    - [3522 : Agentes da saúde e do meio ambiente](#3522--agentes-da-saúde-e-do-meio-ambiente)
    - [3241 : Tecnólogos e técnicos em métodos de diagnósticos e terapêutica](#3241--tecnólogos-e-técnicos-em-métodos-de-diagnósticos-e-terapêutica)
    - [3201 : Técnicos em biologia](#3201--técnicos-em-biologia)
    - [3000 : Outras ocupações de Nível Técnico e Auxiliar em Saúde](#3000--outras-ocupações-de-nível-técnico-e-auxiliar-em-saúde)
- [PESSOAL DE SAÚDE - QUALIFICAÇÃO ELEMENTAR](#pessoal-de-saúde---qualificação-elementar)
    - [5151 : Trabalhadores em serviços de promoção e apoio à saúde](#5151--trabalhadores-em-serviços-de-promoção-e-apoio-à-saúde-1)
    - [3522 : Agentes da saúde e do meio ambiente](#3522--agentes-da-saúde-e-do-meio-ambiente-1)
    - [00000 : Atendente de Enfermagem/Auxiliar operacional de serviços diversos e assemelhados](#00000--atendente-de-enfermagemauxiliar-operacional-de-serviços-diversos-e-assemelhados)
    - [00000 : Outras ocupações de Nível Elementar em Saúde](#00000--outras-ocupações-de-nível-elementar-em-saúde)
- [PESSOAL ADMINISTRATIVO](#pessoal-administrativo)
    - [1000 : Administração](#1000--administração)
    - [7000 : Serviço de Limpeza/Conservação](#7000--serviço-de-limpezaconservação)
    - [5000 : Segurança](#5000--segurança)
    - [5000 : Outras ocupações administrativas](#5000--outras-ocupações-administrativas)

- [PESSOAL DE SAÚDE - QUALIFICAÇÃO ELEMENTAR](#pessoal-de-saúde---qualificação-elementar)
  - [5151 : Trabalhadores em serviços de promoção e apoio à saúde](#5151--trabalhadores-em-serviços-de-promoção-e-apoio-à-saúde-1)
  - [3522 : Agentes da saúde e do meio ambiente](#3522--agentes-da-saúde-e-do-meio-ambiente-1)
  - [00000 : Atendente de Enfermagem/Auxiliar operacional de serviços diversos e assemelhados](#00000--atendente-de-enfermagemauxiliar-operacional-de-serviços-diversos-e-assemelhados)
  - [00000 : Outras ocupações de Nível Elementar em Saúde](#00000--outras-ocupações-de-nível-elementar-em-saúde)

- [PESSOAL ADMINISTRATIVO](#pessoal-administrativo)
  - [1000 : Administração](#1000--administração)
  - [7000 : Serviço de Limpeza/Conservação](#7000--serviço-de-limpezaconservação)
  - [5000 : Segurança](#5000--segurança)
  - [5000 : Outras ocupações administrativas](#5000--outras-ocupações-administrativas)

## Taxonomia de profissões completa

### PESSOAL DE SAÚDE - NÍVEL SUPERIOR

#### 2251 : Médicos clínicos

    225103 : Médico infectologista;
    225105 : Médico acupunturista;
    225106 : Médico legista;
    225109 : Médico nefrologista;
    225110 : Médico alergista e imunologista;
    225112 : Médico neurologista;
    225115 : Médico angiologista;
    225118 : Médico nutrologista;
    225120 : Médico cardiologista;
    225121 : Médico oncologista clínico;
    225122 : Médico cancerologista pediátrico;
    225124 : Médico Pediatra;
    225125 : Médico Clínico;
    225127 : Médico pneumologista;
    225130 : Médico de família e comunidade;
    225133 : Médico psiquiatra;
    225135 : Médico dermatologista;
    225136 : Médico reumatologista;
    225139 : Médico sanitarista;
    225140 : Médico do trabalho;
    225142 : Médico da estratégia de Saúde da Família;
    225145 : Médico em medicina de tráfego;
    225148 : Médico anatomopatologista;
    225150 : Médico em medicina intensiva;
    225151 : Médico Anestesiologista;
    225155 : Médico endocrinologista e metabologista;
    225160 : Médico fisiatra;
    225165 : Médico gastroenterologista;
    225175 : Médico geneticista;
    225180 : Médico geriatra;
    225185 : Médico hematologista;
    225195 : Médico homeopata;

#### 2516 : Assistentes sociais e economistas domésticos

    251605 : Assistente Social;

#### 2234 : Farmacêuticos

    223405 : Farmacêutico;

#### 2252 : Médicos em especialidades cirúrgicas

    225203 : Médico em cirurgia vascular;
    225210 : Médico cirurgião cardiovascular;
    225215 : Médico cirurgião de cabeça e pescoço;
    225220 : Médico cirurgião do aparelho digestivo;
    225225 : Médico Cirurgião Geral;
    225230 : Médico cirurgião pediátrico;
    225235 : Médico cirurgião plástico;
    225240 : Médico cirurgião torácico;
    225250 : Médico Ginecologista e Obstetra;
    225255 : Médico mastologista;
    225260 : Médico neurocirurgião;
    225265 : Médico oftalmologista;
    225270 : Médico ortopedista e traumatologista;
    225275 : Médico otorrinolaringologista;
    225280 : Médico coloproctologista;
    225285 : Médico urologista;
    225290 : Médico cancerologista cirúrgico;
    225295 : Médico cirurgião da mão;

#### 2231 : Médicos

    223127 : Médico foniatra;
    223129 : Médico Generalista Alopata;
    2231A1 : Médico broncoesofalogista;
    2231A2 : Médico hansenologista;

#### 2235 : Enfermeiros e afins

    2235 : Outros enfermeiros;
    223505 : Enfermeiro;
    223510 : Enfermeiro auditor;
    223515 : Enfermeiro de bordo;
    223520 : Enfermeiro de centro cirúrgico;
    223525 : Enfermeiro de terapia intensiva;
    223530 : Enfermeiro do trabalho;
    223535 : Enfermeiro nefrologista;
    223540 : Enfermeiro neonatologista;
    223545 : Enfermeiro obstétrico;
    223550 : Enfermeiro psiquiátrico;
    223555 : Enfermeiro puericultor e pediátrico;
    223560 : Enfermeiro sanitarista;
    223565 : Enfermeiro da estratégia de saúde da família;

#### 0000 : sem CBO

     : Enfermeiro Estomaterapeuta;
     : Fisioterapeuta respiratório;
     : Cirurgião dentista - disfunção temporomandibular e;
     : Cirurgião dentista - odontologia para pacientes co;
     : Cirurgião dentista - traumatologista bucomaxilofac;
     : Médico Cardiologista Intervencionista;
     : Médico em medicina preventiva e social;
     : Médico residente;

#### 2236 : Fisioterapeutas

    223605 : Fisioterapeuta geral;
    223630 : Fisioterapeuta neurofuncional;
    223635 : Fisioterapeuta traumato-ortopédica funcional;
    223640 : Fisioterapeuta osteopata;
    223645 : Fisioterapeuta quiropraxista;
    223650 : Fisioterapeuta acupunturista;
    223655 : Fisioterapeuta esportivo;
    223660 : Fisioterapeuta do trabalho;

#### 2238 : Fonoaudiólogos

    223810 : Fonoaudiólogo;

#### 2237 : Nutricionistas

    223710 : Nutricionista;

#### 2232 : Cirurgiões-dentistas

    223204 : Cirurgião dentista - auditor;
    223208 : Cirurgião dentista - clínico geral;
    223212 : Cirurgião dentista - endodontista;
    223216 : Cirurgião dentista - epidemiologista;
    223220 : Cirurgião dentista - estomatologista;
    223224 : Cirurgião dentista - implantodontista;
    223228 : Cirurgião dentista - odontogeriatra;
    223232 : Cirurgião dentista - odontologista legal;
    223236 : Cirurgião dentista - odontopediatra;
    223240 : Cirurgião dentista - ortopedista e ortodontista;
    223244 : Cirurgião dentista - patologista bucal;
    223248 : Cirurgião dentista - periodontista;
    223252 : Cirurgião dentista - protesiólogo bucomaxilofacial;
    223256 : Cirurgião dentista - protesista;
    223260 : Cirurgião dentista - radiologista;
    223264 : Cirurgião dentista - reabilitador oral;
    223272 : Cirurgião dentista de saúde coletiva;
    223276 : Cirurgião dentista - odontologia do trabalho;
    223280 : Cirurgião dentista - dentística;
    223293 : Cirurgião-dentista da estratégia de saúde da família;

#### 2515 : Psicólogos e psicanalistas

    251505 : Psicólogo Educacional;
    251510 : Psicólogo Clínico;
    251515 : Psicólogo do Esporte;
    251520 : Psicólogo Hospitalar;
    251525 : Psicólogo Jurídico;
    251530 : Psicólogo Social;
    251535 : Psicólogo do trânsito;
    251540 : Psicólogo do Trabalho;
    251555 : Psicólogo acupunturista;

#### 2253 : Médicos em medicina diagnóstica e terapêutica

    225305 : Médico citopatologista;
    225310 : Médico em endoscopia;
    225315 : Médico em medicina nuclear;
    225320 : Médico em radiologia e diagnóstico por imagem;
    225325 : Médico patologista;
    225330 : Médico radioterapeuta;
    225335 : Médico patologista clínico / medicina laboratorial;
    225345 : Médico hiperbarista;
    225350 : Médico neurofisiologista clínico;

#### 2000 : Outras ocupações de Nível Superior Relacionados à Saúde

    203005 : Pesquisador em Biologia Ambiental;
    203010 : Pesquisador em Biologia Animal;
    203015 : Pesquisador em biologia de Microorganismos e Parasitas;
    203020 : Pesquisador em Biologia Humana;
    203305 : Pesquisador de Clinica Médica;
    203310 : Pesquisador de Medicina Básica;
    203320 : Pesquisador em Saúde Coletiva;
    203505 : Pesquisador em Ciências Sociais e Humanas;
    203525 : Pesquisador em Psicologia;
    213105 : Físico;
    213150 : Físico (medicina);
    213155 : Físico (nuclear e reatores);
    213205 : Químico;
    221105 : Biólogo;
    221205 : BioMédico;
    222105 : Engenheiro Agrícola;
    222110 : Engenheiro Agrônomo;
    223305 : Médico veterinário;
    223905 : Terapeuta ocupacional;
    223910 : Ortoptista;
    224120 : Preparador Físico;
    231205 : Professor da Educação de Jovens e Adulto;
    231315 : Professor de educação física do ensino fundamental;
    232105 : Professor de Artes no Ensino Médio;
    232105 : Professor de Artes no Ensino Médio;
    234410 : Professor de educação física no ensino superior;
    234445 : Professor de Nutrição;
    234455 : Professor de Terapia Ocupacional;
    239205 : Professor de alunos com deficiência auditiva e surdos;
    239210 : Professor de alunos com deficiência física;
    239220 : Professor de alunos com deficiência múltipla;
    239225 : Professor de alunos com deficiência visual;
    239405 : Coordenador Pedagógico;
    239410 : Orientador Educacional;
    239415 : Pedagogo;
    239420 : Professor de técnicas e Recursos Audiovisuais;
    239425 : Psicopedagogo;
    251545 : Neuropsicólogo;
    251550 : Psicanalista;
    262620 : Musicólogo;

## PESSOAL DE SAÚDE - NÍVEL TÉCNICO TÉCNICO/AUXILIAR

#### 3222 : Técnicos e auxiliares de enfermagem

    322205 : Técnico de enfermagem;
    322210 : Técnico de enfermagem de terapia intensiva;
    322215 : Técnico de enfermagem do trabalho;
    322220 : Técnico de enfermagem psiquiátrica;
    322230 : Auxiliar de Enfermagem;
    322235 : Auxiliar de Enfermagem do Trabalho;
    322250 : Auxiliar de enfermagem da estratégia de saúde da família;
    3222E1 : Técnico de enfermagem de saúde da família;

#### 5151 : Trabalhadores em serviços de promoção e apoio à saúde

    515120 : Visitador Sanitário;

#### 000000 : sem CBO

     : Socorrista (exceto médicos e enfermeiros) habilita;
     : Auxiliar de laboratório de análises físico-química;
     : Técnico de laboratório de análises físico-químicas;
     : Auxiliar de Radiologia (Revelação Fotográfica);

#### 3251 : Técnico em farmácia e em manipulação farmacêutica

    325105 : Auxiliar técnico em laboratório de farmácia;
    325110 : Técnico em Laboratório de Farmácia;
    325115 : Técnico em Farmácia;

#### 8103 : Supervisores de produção em indústrias de produtos farmacêuticos, cosméticos e afins

    810305 : Mestre de produção farmacêutica;

#### 5152 : Auxiliares de laboratório da saúde

    515205 : Auxiliar de banco de sangue;
    515210 : Auxiliar de Farmácia de Manipulação;
    515215 : Auxiliar de Laboratório de Análises Clínicas;
    515220 : Auxiliar de Laboratório de Imunobiológicos;
    515225 : Auxiliar de Produção Farmacêutica;

#### 3253 : Técnicos de apoio à biotecnologia

    325310 : Técnico em Imunobiológicos;

#### 3242 : Técnicos de laboratórios de saúde e bancos de sangue

    324205 : Técnico em patologia clínica;
    324210 : Auxiliar Técnico em Patologia Clínica;

#### 2237 : Nutricionistas

    223705 : Dietista;

#### 3225 : Técnicos em próteses ortopédicas

    322505 : Técnico de ortopedia;

#### 3135 : Técnicos em fotônica

    3135D1 : Técnico em reabilitação;
    3135D2 : Técnico em equipamento médico hospitalar;

#### 3226 : Técnicos de imobilizações ortopédicas

    322605 : Técnico de imobilização ortopédica;

#### 3224 : Técnicos de odontologia

    322405 : Técnico em saúde bucal;
    322410 : Protético Dentário;
    322420 : Auxiliar de Prótese Dentária;

#### 3522 : Agentes da saúde e do meio ambiente

    352205 : Agente de defesa ambiental;

#### 3241 : Tecnólogos e técnicos em métodos de diagnósticos e terapêutica

    324115 : Técnico em radiologia e imagenologia;

#### 3201 : Técnicos em biologia

    320110 : Técnico em Histologia;

#### 3000 : Outras ocupações de Nível Técnico e Auxiliar em Saúde

    224125 : Técnico de Desporto Individual e Coletivo;
    239215 : Professor de Alunos Com Deficiência Menta;
    262705 : Musico Intérprete Cantor;
    262710 : Musico Intérprete Instrumentista;
    263105 : Ministro de Culto Religioso;
    311105 : Técnico Químico;
    312210 : Técnico de Saneamento;
    313505 : Técnico em Laboratório Óptico;
    322105 : Técnico em acupuntura;
    322115 : Quiropraxista Cinesoterapeuta Eutonista;
    322225 : Instrumentador Cirúrgico;
    322240 : Auxiliar de Saúde (Navegação Marítima);
    322305 : Técnico em Óptica e Optometria Contatólog;
    324105 : Técnico em Métodos Eletrográficos em Ence;
    324110 : Técnico em Métodos Gráficos em Cardiologia;
    325205 : Técnico de Alimentos;
    331105 : Professor de Nível Médio Na Educação Inf;
    331110 : Auxiliar de Desenvolvimento Infantil;
    331305 : Professor de Nível Médio No Ensino Profis;
    333110 : Instrutor de Cursos Livres;
    371410 : Recreador;
    376215 : Artista de Circo (Outros);
    911205 : Mecânico de manutenção e instalação de aparelhos de climatização e refrigeração;
    911305 : Mecânico de manutenção de máquinas, em geral;
    914405 : Mecânico de manutenção de automóveis, motocicletas e veículos similares;
    992225 : Auxiliar geral de conservação de vias permanentes (exceto trilhos);

## PESSOAL DE SAÚDE - QUALIFICAÇÃO ELEMENTAR

#### 5151 : Trabalhadores em serviços de promoção e apoio à saúde

    515105 : Agente comunitário de saúde;
    515115 : Parteira leiga;


#### 3522 : Agentes da saúde e do meio ambiente

    352210 : Agente de saúde pública;

#### 00000 : Atendente de Enfermagem/Auxiliar operacional de serviços diversos e assemelhados

    322415 : Atendente de consultório dentário;
    515110 : Atendente de enfermagem;
    521130 : Atendente de farmácia - balconista;

#### 00000 : Outras ocupações de Nível Elementar em Saúde

    716405 : Gesseiro;
    752105 : Artesão modelador (vidros);

## PESSOAL ADMINISTRATIVO

#### 1000 : Administração

    123105 : Diretor administrativo;
    123110 : Diretor administrativo e financeiro;
    123115 : Diretor financeiro;
    123205 : Diretor de recursos humanos;
    123210 : Diretor de relações de trabalho;
    123305 : Diretor comercial;
    123310 : Diretor de marketing;
    123405 : Diretor de suprimentos;
    123410 : Diretor de suprimentos no serviço publico;
    123605 : Diretor de serviços de informática;
    123705 : Diretor de pesquisa e desenvolvimento (p\&d);
    123805 : Diretor de manutenção;
    131105 : Diretor de serviços culturais;
    131110 : Diretor de serviços sociais;
    131115 : Gerente de serviços culturais;
    131120 : Gerente de serviços sociais;
    131205 : Diretor de serviços de saúde;
    131210 : Gerente de serviços de saúde;
    141205 : Gerente de produção e operações;
    142105 : Gerente administrativo;
    142110 : Gerente de riscos;
    142115 : Gerente financeiro;
    142205 : Gerente de recursos humanos;
    142210 : Gerente de departamento pessoal;
    142305 : Gerente comercial;
    142310 : Gerente de comunicação;
    142315 : Gerente de marketing;
    142320 : Gerente de vendas;
    142405 : Gerente de compras;
    142410 : Gerente de suprimentos;
    142415 : Gerente de almoxarifado;
    142505 : Gerente de rede;
    142510 : Gerente de desenvolvimento de sistemas;
    142515 : Gerente de operação de tecnologia da informação;
    142520 : Gerente de projetos de tecnologia da informação;
    142525 : Gerente de segurança da informação;
    142530 : Gerente de suporte técnico de tecnologia da informação;
    142605 : Gerente de pesquisa e desenvolvimento (p\&d);
    142705 : Gerente de projetos e serviços de manutenção;
    211115 : Matemático;
    212305 : Administrador de banco de dados;
    212315 : Administrador de sistemas operacionais;
    212410 : Analista de redes e de comunicação de dados;
    212420 : Analista de suporte computacional;
    214105 : Arquiteto de edificações;
    214205 : Engenheiro civil;
    214260 : Engenheiro civil (saneamento);
    214915 : Engenheiro de segurança do trabalho;
    234120 : Professor de computação (no ensino superior);
    241005 : Advogado;
    241010 : Advogado de empresa;
    251610 : Economista domestico;
    252105 : Administrador;
    252205 : Auditor (contadores e afins);
    252210 : Contador;
    252305 : Secretário executivo;
    252545 : Analista financeiro (instituições financeiras);
    254410 : Fiscal de tributos municipal;
    261305 : Arquivista;
    313215 : Técnico eletrônico;
    313220 : Técnico em manutenção de equipamentos de informática;
    314405 : Técnico de manutenção de sistemas e instrumentos;
    317110 : Programador de sistemas de informação;
    317205 : Operador de computador;
    317210 : Técnico de suporte ao usuário de tecnologia da informação;
    351105 : Técnico de contabilidade;
    351110 : Chefe de contabilidade (técnico);
    351305 : Técnico em Administração;
    351505 : Técnico em secretariado;
    351605 : Técnico em segurança do trabalho;
    354205 : Comprador;
    354210 : Supervisor de compras;
    410105 : Supervisor administrativo;
    410205 : Supervisor de almoxarifado;
    410215 : Supervisor de contas a pagar;
    410220 : Supervisor de controle patrimonial;
    410235 : Supervisor de tesouraria;
    411005 : Auxiliar de escritório;
    411010 : Assistente técnico administrativo;
    411030 : Auxiliar de pessoal;
    411035 : Auxiliar de estatística;
    412105 : Datilografo;
    412110 : Digitador;
    412205 : Continuo;
    413110 : Auxiliar de contabilidade;
    413115 : Auxiliar de faturamento;
    413205 : Atendente de agencia;
    414105 : Almoxarife;
    415105 : Arquivista de documentos;
    420125 : Supervisor de recepcionistas;
    421305 : Cobrador externo;
    422105 : Recepcionista, em geral;
    422110 : Atendente de ambulatório ou clínica;
    422205 : Telefonista;
    422220 : Operador de rádiochamada;
    422310 : Operador de telemarketing ativo e receptivo;
    422320 : Operador de telemarketing técnico;
    510105 : Supervisor de transportes;
    510115 : Supervisor de andar;

#### 7000 : Serviço de Limpeza/Conservação

    254310 : Agente de higiene e segurança;
    512105 : Empregado doméstico nos serviços gerais;
    514120 : Zelador de edifício;
    516305 : Lavadeiro, em geral;
    516310 : Lavador de roupas à máquina;
    516325 : Passador de roupas em geral;
    516340 : Atendente de lavanderia;
    516345 : Auxiliar de lavanderia;
    622010 : Jardineiro;
    715210 : Pedreiro;
    715615 : Eletricista de instalações;
    717020 : Servente de obras;
    723310 : Pintor a pincel e rolo (exceto obras e estruturas metálicas);
    724110 : Encanador;
    725010 : Ajustador mecânico;
    771105 : Marceneiro;
    862120 : Operador de caldeira;

#### 5000 : Segurança

    517215 : Guarda-civil municipal;
    517310 : Agente de segurança;
    517315 : Agente de segurança penitenciária;
    517330 : Vigilante;
    517410 : Porteiro de edifícios;
    517420 : Vigia;
    519925 : Guardador de veículos;
    783105 : Agente de pátio;

#### 5000 : Outras ocupações administrativas

    513205 : Cozinheiro geral;
    513220 : Cozinheiro de hospital;
    513225 : Cozinheiro de embarcações;
    513425 : Copeiro;
    513430 : Copeiro de hospital;
    514105 : Ascensorista;
    514225 : Trabalhador de serviços de manutenção;
    763015 : Costureira de reparação de roupas;
    763210 : Costureiro na confecção em serie;
    764305 : Acabador de calçados;
    782305 : Motorista de carro de passeio;
    782310 : Motorista de furgão ou veículo similar;
    841408 : Cozinhador conservação de alimentos;
