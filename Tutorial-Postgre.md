
    create table obra
    (id_obra serial primary key,
     codigo_obra varchar(10) not null,
     nome_obra varchar(200) not null,
     fator_k numeric(5, 4) not null,
     bdi numeric(6, 4));
     
    create table item
    (id_item serial primary key,
     codigo_item varchar(20) not null,
     descricao varchar(300) not null,
     unidade varchar(5) not null,
     preco_unitario numeric(15, 2) not null);
     
     create table item_orcado
     (id_orcado serial primary key,
      id_obra int not null references obra(id_obra),
      id_item int not null references item(id_item), quantidade numeric(15, 4) not null default 0,
      preco_final numeric(15, 2));

---

**Query #1**

    insert into obra (codigo_obra, nome_obra, fator_k, bdi) values ('00000D', 'MANUT.ELET.PREV.E. COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02', 0.7600, 0.2404),
     ('11111A', 'CCO - CADASTRO GERAL SINAPI', 0.7600, 0.2404),
     ('22222B', 'MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2', 0.7600, 0.2404);

There are no results to be displayed.

---
**Query #2**

    SELECT * FROM obra;

| id_obra | codigo_obra | nome_obra                                                                 | fator_k | bdi    |
| ------- | ----------- | ------------------------------------------------------------------------- | ------- | ------ |
| 1       | 00000D      | MANUT.ELET.PREV.E. COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02 | 0.76    | 0.2404 |
| 2       | 11111A      | CCO - CADASTRO GERAL SINAPI                                               | 0.76    | 0.2404 |
| 3       | 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 0.76    | 0.2404 |

---
**Query #3**

    insert into item(codigo_item, descricao, unidade, preco_unitario) values
     ('27-01-01-001 O', 'ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00', 'UN', 251.98),
     ('27-01-01-006 O', 'ADMINISTRACAO LOCAL PARA O.S. DE R$ 5.000,01 A R$ 10.000,00', 'UN', 2081.60),
    ('27-01-01-013', 'DESLOCAMENTO PARA CAMINHAO CARROCERIA, INCLUSIVE MOTORISTA E COMBUSTIVEL', 'KM', 5.74),
    ('02-01-01-300 O', 'ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - AJUDANTE ESPECIALIZADO CS:88243', 'H', 22.54);

There are no results to be displayed.

---
**Query #4**

    SELECT * FROM item;

| id_item | codigo_item    | descricao                                                                     | unidade | preco_unitario |
| ------- | -------------- | ----------------------------------------------------------------------------- | ------- | -------------- |
| 1       | 27-01-01-001 O | ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00                                 | UN      | 251.98         |
| 2       | 27-01-01-006 O | ADMINISTRACAO LOCAL PARA O.S. DE R$ 5.000,01 A R$ 10.000,00                   | UN      | 2081.6         |
| 3       | 27-01-01-013   | DESLOCAMENTO PARA CAMINHAO CARROCERIA, INCLUSIVE MOTORISTA E COMBUSTIVEL      | KM      | 5.74           |
| 4       | 02-01-01-300 O | ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - AJUDANTE ESPECIALIZADO CS:88243 | H       | 22.54          |

---
**Query #5**

    insert into item_orcado(id_obra, id_item, quantidade, preco_final) values
    -- obra 00000D
    (1, 1, 5.00, 191.50),
    (1, 3, 120.00, 4.36),
    (1, 4, 8.00, 23.14),
    -- obra 11111A
    (2, 2, 3.00, 1582.02),
    (2, 5, 10.00, 17.13),
    
    -- obra 22222B
    (3, 1, 2.00, 191.50),
    (3, 4, 20.00, 23.14);

There are no results to be displayed.

---
**Query #6**

    SELECT * FROM item_orcado;

| id_orcado | id_obra | id_item | quantidade | preco_final |
| --------- | ------- | ------- | ---------- | ----------- |
| 1         | 1       | 1       | 5.0        | 191.5       |
| 2         | 1       | 3       | 120.0      | 4.36        |
| 3         | 1       | 4       | 8.0        | 23.14       |
| 4         | 2       | 2       | 3.0        | 1582.02     |
| 5         | 2       | 5       | 10.0       | 17.13       |
| 6         | 3       | 1       | 2.0        | 191.5       |
| 7         | 3       | 4       | 20.0       | 23.14       |

---
**Query #7**

    select
    o.codigo_obra,
    o.nome_obra,
    o.fator_k,
    i.codigo_item,
    i.descricao,
    i.unidade,
    i.preco_unitario,
    io.quantidade,
    io.preco_final,
    round(io.quantidade * io.preco_final, 2) as total_item
    from item_orcado io
    inner join obra o on io.id_obra = o.id_obra
    inner join item i ON io.id_item = i.id_item
    order by o.codigo_obra, i.codigo_item;

| codigo_obra | nome_obra                                                                 | fator_k | codigo_item    | descricao                                                                     | unidade | preco_unitario | quantidade | preco_final | total_item |
| ----------- | ------------------------------------------------------------------------- | ------- | -------------- | ----------------------------------------------------------------------------- | ------- | -------------- | ---------- | ----------- | ---------- |
| 00000D      | MANUT.ELET.PREV.E. COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02 | 0.76    | 02-01-01-300 O | ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - AJUDANTE ESPECIALIZADO CS:88243 | H       | 22.54          | 8.0        | 23.14       | 185.12     |
| 00000D      | MANUT.ELET.PREV.E. COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02 | 0.76    | 27-01-01-001 O | ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00                                 | UN      | 251.98         | 5.0        | 191.5       | 957.5      |
| 00000D      | MANUT.ELET.PREV.E. COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02 | 0.76    | 27-01-01-013   | DESLOCAMENTO PARA CAMINHAO CARROCERIA, INCLUSIVE MOTORISTA E COMBUSTIVEL      | KM      | 5.74           | 120.0      | 4.36        | 523.2      |
| 11111A      | CCO - CADASTRO GERAL SINAPI                                               | 0.76    | 27-01-01-006 O | ADMINISTRACAO LOCAL PARA O.S. DE R$ 5.000,01 A R$ 10.000,00                   | UN      | 2081.6         | 3.0        | 1582.02     | 4746.06    |
| 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 0.76    | 02-01-01-300 O | ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - AJUDANTE ESPECIALIZADO CS:88243 | H       | 22.54          | 20.0       | 23.14       | 462.8      |
| 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 0.76    | 27-01-01-001 O | ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00                                 | UN      | 251.98         | 2.0        | 191.5       | 383.0      |

---
**Query #8**

    SELECT
    o.codigo_obra,
    o.nome_obra,
    o.fator_k,
    o.bdi,
    count(io.id_orcado) as qtd_itens,
    sum(io.quantidade * io.preco_final) as valor_total_k,
    ROUND(
    sum(io.quantidade * io.preco_final)
    * (1 + o.bdi), 2
    ) AS valor_com_bdi
    from item_orcado io
    inner join obra o on io.id_obra = o.id_obra
    inner join item i on io.id_item = i.id_item
    group by o.id_obra, o.codigo_obra, o.nome_obra, o.fator_k, o.bdi
    order by valor_com_bdi desc;

| codigo_obra | nome_obra                                                                 | fator_k | bdi    | qtd_itens | valor_total_k | valor_com_bdi |
| ----------- | ------------------------------------------------------------------------- | ------- | ------ | --------- | ------------- | ------------- |
| 11111A      | CCO - CADASTRO GERAL SINAPI                                               | 0.76    | 0.2404 | 1         | 4746.06       | 5887.01       |
| 00000D      | MANUT.ELET.PREV.E. COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02 | 0.76    | 0.2404 | 3         | 1665.82       | 2066.28       |
| 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 0.76    | 0.2404 | 2         | 845.8         | 1049.13       |
