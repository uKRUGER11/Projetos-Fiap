UPDATE mc_produto SET VL_PERC_LUCRO = 0.3;
DELETE FROM mc_produto ;

-- Commandos DQL

-- Retorna todos os registros de uma tabela
select 
    * 
from 
    mc_cliente;

-- Retorna o nome e valor do salario de um funcionário específico  
select 
    nm_funcionario, 
    vl_salario 
FROM 
    mc_funcionario 
WHERE 
    cd_funcionario = 5;

-- Query abaixo retorna todos os endereços cadastrados
SELECT
    l.cd_logradouro,
    l.nm_logradouro,
    b.nm_bairro,
    c.nm_cidade,
    e.nm_estado
FROM
         mc_logradouro l
    INNER JOIN mc_bairro b ON ( l.cd_bairro = b.cd_bairro )
    INNER JOIN mc_cidade c ON ( b.cd_cidade = c.cd_cidade )
    INNER JOIN mc_estado e ON ( c.sg_estado = e.sg_estado );

-- Query abaixo retorna a quantidade de cada registro único nas tabelas logradouro, bairro, cidade, estado
SELECT
    COUNT(DISTINCT l.cd_logradouro) AS qty_lougradouro,
    COUNT(DISTINCT b.cd_bairro)     AS qty_bairro,
    COUNT(DISTINCT c.cd_cidade)     AS qty_cidade,
    COUNT(DISTINCT e.sg_estado)     AS qty_estado
FROM
    mc_logradouro l
    LEFT JOIN mc_bairro     b ON ( l.cd_bairro = b.cd_bairro )
    LEFT JOIN mc_cidade     c ON ( b.cd_cidade = c.cd_cidade )
    LEFT JOIN mc_estado     e ON ( c.sg_estado = e.sg_estado );
    
    
-- Query abaixo retorna o nome do produto, codigo da categoria e nome a categoria. Por ser um RIGHT JOIN, temos os dados de categoria que nao possuem nenhuma associação com produto.
SELECT
    p.ds_produto,
    p.vl_perc_lucro,
    c.cd_categoria,
    c.ds_categoria
FROM 
    mc_produto p
RIGHT
    JOIN mc_categoria_prod c ON (p.cd_categoria = c.cd_categoria);
