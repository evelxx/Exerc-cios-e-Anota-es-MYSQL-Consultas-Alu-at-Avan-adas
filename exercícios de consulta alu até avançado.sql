SELECT CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO,
LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA FROM tabela_de_clientes;

select * from tabela_de_clientes where idade > 25;


select distinct bairro from tabela_de_clientes where cidade = 'rio de janeiro' limit 2,3;

select * from notas_fiscais where DATA_VENDA = '2017-01-01' limit 10;


select * from tabela_de_produtos where NOME_DO_PRODUTO like'linha refrescante %';

select *, count(*) as contador from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' group by quantidade order by QUANTIDADE desc;

select * from itens_notas_fiscais;

select data_venda,count(DATA_VENDA) as quantos_vendeu, cpf from notas_fiscais where DATA_VENDA between '2016-01-01' and '2016-12-31' group by
 cpf order by quantos_vendeu desc; 

select nome, cpf from tabela_de_clientes where cpf = '50534475787' or '3623344710' or '492472718' ; /*DEU ERRADO, FOI IDEIA MINHA*/

select NOME, data_de_nascimento, 
case 
when year(data_de_nascimento)<1990 then 'VELHO(A)'
when year(data_de_nascimento) between 1990 and 1995 then 'JOVEM'
when year(data_de_nascimento)>1995 then 'NENÉM'
END AS CLASSIFICAÇÃO
FROM tabela_de_clientes;

select a.data_venda, b.quantidade, b.preco from notas_fiscais a inner join itens_notas_fiscais b on a.numero = b.numero;
select sum(quantidade * preco) as soma_valores_produto from itens_notas_fiscais;
select sum (soma_valores_produto) from itens_notas_fiscais;

select year(data_venda), sum(quantidade*preco) as faturamento_prod from notas_fiscais NF inner join itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO GROUP BY year(DATA_VENDA);

select cpf, DATA_VENDA from notas_fiscais where DATA_VENDA between 2015-01-01 and 2015-12-31;

select x.cpf, x.quantas from (select cpf, count(*) as quantas from notas_fiscais where DATA_VENDA = year(2015)group by 
cpf)x where x.quantas > 2000; /*deu errado mesmo sendo igual a resposta do exercício do alura*/

select*from notas_fiscais;

select embalagem , max(preco_de_lista) as maior_preco from tabela_de_produtos group by EMBALAGEM;

select x.EMBALAGEM, x.maior_preco from (select embalagem , max(preco_de_lista) as maior_preco from tabela_de_produtos group by EMBALAGEM) x
where x.maior_preco >= 10; /*esse foi similar ao exercício do alura mas deu certo, acho que o problema está no count()*/

select x.EMBALAGEM, x.maior_preco from VW_MAIORES_EMBALAGENS X where x.maior_preco >= 10; /*IGUAL AO CASO DE CIMA SÓ QUE COM O VW*/

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO, (A.PRECO_DE_LISTA/X.MAIOR_PRECO) * 100 AS PERCENTUAL FROM 
tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS X ON A.EMBALAGEM = X.EMBALAGEM; /* UM INNER COM A PORCENTAGEM DO PREÇO DO PRODUTO
REFERENTE AO MAIOR PREÇO DO PROTUDO NAQUELE TIPO DE EMBALAGEM*/

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO, ((A.PRECO_DE_LISTA/X.MAIOR_PRECO) -1)* 100 AS PERCENTUAL FROM 
tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS X ON A.EMBALAGEM = X.EMBALAGEM; /* UM INNER COM A PORCENTAGEM DO PREÇO DO PRODUTO, 
TIPO: O PREÇO DO SABOR DA MONTANHA É 52% DO VALOR DA GARRAFA MAIS CARA*/

SELECT ltrim('         OLÁ') AS RESULTADO;

SELECT rtrim('OLÁ      ') AS NOVORESULTADO;

SELECT trim('    OLÁ    ') AS RES;

SELECT CONCAT('OLÁ', 'TUDO', 'BEM', '?') AS RESPOSTA;

SELECT UPPER('OLÁ, tudo bem?') as res;

select lower('OLÁ') AS RES;

SELECT SUBSTRING('OLÁ, TUDO BEM', 6) AS RES;/*DA POSIÇÃO 6,  PEGA O RESTANTE*/

SELECT substring('OLÁ, TUDO BEM?', 6, 4) AS RES;/*DA POSIÇÃO 6, PEGA 4 E RESPONDE*/

SELECT concat(NOME, ' (', CPF, ' )') AS RESULTADO FROM tabela_de_clientes;

SELECT CONCAT(NOME, '(', ESTADO, '-', CIDADE, '-', BAIRRO, '-', ENDERECO_1, ')')AS NOME_ENDERECO  FROM tabela_de_clientes;

select curdate();

select current_time();

select current_timestamp(); /*dia e hora da máquina de onde esteja o servidor*/

select year(current_timestamp());

select day(current_timestamp());

select month(current_timestamp());

select monthname(current_timestamp());

select datediff(current_timestamp(), '2001-03-19') as quantosdiaseuvivi; /* o maior dia no início para calcular a diferença*/

select date_sub(current_timestamp(), interval 5 day) as resultado; /* dia de hoje menos 5 dias*/

select current_timestamp() as dia_hoje, date_sub(current_timestamp(), interval 15 day) as quinze_dias_antes;

select distinct data_venda, dayname(data_venda) as dia, monthname(data_venda) as mes, year(data_venda) as ano from notas_fiscais;

select nome, timestampdiff(year,data_de_nascimento, curdate()) as idade from tabela_de_clientes; /*calculou a idade*/

SELECT CEILING(12.33333232323) AS RESULTADO;

SELECT ROUND(12.33333232323) AS RESULTADO;
SELECT ROUND(12.7777232323) AS RESULTADO;

SELECT FLOOR(12.7777232323) AS RESULTADO;

SELECT RAND() AS RESULTADO; 

SELECT NUMERO, QUANTIDADE, PRECO FROM ITENS_NOTAS_FISCAIS;

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO FROM ITENS_NOTAS_FISCAIS;

 SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM ITENS_NOTAS_FISCAIS; /*no round vc pode por quantas casas decimais
 depois da vírgula vc quer que apareça*/
 
 select x.imposto, b.quantidade, round(b.preco,2), (round(b.PRECO * x.IMPOSTO,3) * b.quantidade) as valor_imposto_total from (select numero, imposto from notas_fiscais where year(data_venda)=2016) x left join itens_notas_fiscais b
 on x.numero = b.numero; /* exercício : quanto foi o valor total impostos pagos no ano de 2016*/
 
 select * from tabela_de_clientes;
 
 select concat('o', '(', 'a', ')', nome, 'faturou 120000 no ano de 2016') as lista from tabela_de_clientes;
 
 select x.cpf, x.quantas from (select cpf, count(*) as quantas from notas_fiscais where DATA_VENDA = year(2015) group by 
cpf)x where x.quantas > 2000; 


select concat('o', '(', 'a', ')', nome, 'faturou 120000 no ano de 2016') as lista from tabela_de_clientes;


select b.year(data_venda = 2016), x.nome from ( select concat('o', '(', 'a', ')', nome, 'faturou 120000 no ano de 2016') as lista from tabela_de_clientes) x
inner join notas_fiscais b on b.cpf = x.cpf order by nome; /* deu errado*/

SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA); /*resposta a como colocar oq cada cliente faturou no ano de 2016*/

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y - %U') ) AS RESULTADO;

SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA); /* resposta do professor em como calcular todos os gastos em 2016 com impostos, o gato total mesmo*/


/* LIMITE DE COMPRA POR CLIENTE */
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM TABELA_DE_CLIENTES TC;

SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, max(TC.VOLUME_DE_COMPRA) AS 
QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');


/***************************/


SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;


/* A QUANTIDADE DE VENDAS INVÁLIDAS POR CADA MES DE CADA ANO DE CADA CLIENTE, POIS CADA CLIENTE TEM UM LIMITE DE COMPRA.

O MAX() ALI  É UM MACETE PARA QUE O DUPLO INNER COM O GROUP BY NÃO SOME TAMBÉM OS VOLUMES DE LIMITE DE COMPRA DE CADA CLIENTE A CADA MÊS E SIM, 
SÓ MOSTRE O MÁXIMO DO LIMITE DE COMPRA QUE JÁ É UM VALOR ÚNICO. */ 

/*********************/

SELECT U.CPF, U.NOME, (1 - ( U.QUANTIDADE_LIMITE / U.QUANTIDADE_VENDAS )) * 100 AS SO_INVALIDOS FROM 
(SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X) U ;

/* TENTEI FAZER ESSA DE CIMA MAS A RESPOSTA NÃO FOI A MESMA QUE A DO EXERCÍCIO*/


/* ESSA ABAIXO É A RESPOSTA DO EXERCÍCIO */
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA, (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM (SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X
WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;


/* acompanhamento das vendas do ano de 2016, quantidade em litros vendidos durante o ano todo. ordenado por sabor e o percentual do volume de 
litros totais vendidos */

/*junta as três tabelas*/

SELECT TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;

/*depois de fazer um monte de coisa passo a passo: aí está ela pronta*/

SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
ROUND((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN  /* esse inner com uma subconsulta é para se fazer o percentual, onde essa 2ª consulta "chama" um valor total para se dividido na 1ª consulta*/
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_SABOR.QUANTIDADE DESC;


/* resposta ao exercício de rankear a consulta anterior pelo tamanho... e usei um comando novo que vi online mas a resposta do professor foi outra*/

SELECT ROW_NUMBER() OVER(ORDER BY VENDA_SABOR.QUANTIDADE desc) AS ranking ,VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
ROUND((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN /* esse inner com uma subconsulta é para se fazer o percentual, onde essa 2ª consulta "chama" um valor total para se dividido na 1ª consulta*/
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_SABOR.QUANTIDADE DESC;

/* o ranking dessa de cima foi colocado por mim. Consegui concluir aaaaaaaa *-*  */


/* resposta do professor*/

SELECT VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.QUANTIDADE,
ROUND((VENDA_TAMANHO.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) AS VENDA_TAMANHO
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_TAMANHO.QUANTIDADE DESC;

/* tá, não fiz certo o exercío por não entender bem o enunciado :/   */

  