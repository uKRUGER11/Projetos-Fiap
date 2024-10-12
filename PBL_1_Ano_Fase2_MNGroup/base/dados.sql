--Inserindo registros na tabela mc_depto

/*
NOTAS: 
- Erro Intencional nas linhas 516, 564 e 573.
*/

INSERT INTO MC_DEPTO (NM_DEPTO, ST_DEPTO) VALUES('Comercial', 'A');
INSERT INTO MC_DEPTO (NM_DEPTO, ST_DEPTO) VALUES('Financeiro', 'A');
INSERT INTO MC_DEPTO (NM_DEPTO, ST_DEPTO) VALUES('SAC', 'A');

--Inserindo registros na tabela mc_funcionario

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(1, null, 'Picolina Osorio Fortes', TO_DATE('10-04-1989', 'DD-MM-YYYY'), 'F', 'Mulher CisgÃªnero', 'Gerente de Vendas', 11983.00, 'pic.fortes@mc.com', 'A', TO_DATE('13-01-2013', 'DD-MM-YYYY'), null);


INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(1, 1, 'Rachel Karen Green', TO_DATE('05-05-1979', 'DD-MM-YYYY'), 'F', 'Mulher CisgÃªnero', 'Vendedor(a) V', 4867.55, 'rachel.green@mc.com', 'A', TO_DATE('14-08-2019', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(1, 1, 'Gavin Edward Mitchell', TO_DATE('08-08-1981', 'DD-MM-YYYY'), 'M', 'Homem CisgÃªnero', 'Vendedor(a) II', 3498.4, 'gavin.mitchell@mc.com', 'A', TO_DATE('04-09-2023', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(2, null, 'Chandler Muriel Bing', TO_DATE('10-04-1978', 'DD-MM-YYYY'), 'M', null, 'Gerente Financeiro', 27023.89, 'chandler.bing@mc.com', 'A', TO_DATE('13-01-2013', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(2, 4, 'Michael Gary Scott', TO_DATE('09-09-1963', 'DD-MM-YYYY'), 'M', null, 'Analista Financeiro Senior I', 12432.69, 'michael.scott@mc.com', 'A', TO_DATE('28-02-2019', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(2, 4, 'James Duncan Halpert', TO_DATE('16-03-1982', 'DD-MM-YYYY'), 'M', 'Homem CisgÃªnero', 'Especialista Financeiro', 13008.55, 'james.halpert@mc.com', 'A', TO_DATE('19-10-2019', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(3, null, 'Pamela Morgan Halpert', TO_DATE('11-12-1981', 'DD-MM-YYYY'), 'F', 'Mulher CisgÃªnero', 'Gerente de SAC', 27023.89, 'pamela.halpert@mc.com', 'A', TO_DATE('27-11-1019', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(2, 6, 'Phoebe Buffay-Hannigan', TO_DATE('16-02-1985', 'DD-MM-YYYY'), 'F', null, 'Atendente IV', 4098.77, 'phoebe.buffay@mc.com', 'A', TO_DATE('30-06-2023', 'DD-MM-YYYY'), null);

INSERT INTO MC_FUNCIONARIO (
    CD_DEPTO,
    CD_GERENTE,
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FL_SEXO_BIOLOGICO,
    DS_GENERO,
    DS_CARGO,
    VL_SALARIO, 
    DS_EMAIL,
    ST_FUNC,
    DT_CADASTRAMENTO,
    DT_DESLIGAMENTO)
VALUES(2, 6, 'Joseph Francis Tribbiani', TO_DATE('09-01-1980', 'DD-MM-YYYY'), 'M', 'Homem CisgÃªnero', 'Atendente IV', 4098.77, 'joseph.tribbiani@mc.com', 'A', TO_DATE('30-06-2023', 'DD-MM-YYYY'), null);

--Inserindo registros na tabela mc_estado

INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('SP', 'SÃ£o Paulo');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('PI', 'PiauÃ­');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('MG', 'Minas Gerais');

-- Inserindo registros na tabela mc_cidade

INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD) VALUES ('SP', 'SÃ£o Paulo', 3550308, 11);
INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD) VALUES ('SP', 'SÃ£o Bernardo do Campo', 3548708, 11);
INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD) VALUES ('MG', 'Belo Horizonte', 3106200, 31);
INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD) VALUES ('MG', 'Juiz de Fora', 3136702, 32);
INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD) VALUES ('PI', 'Teresina', 2211001, 86);
INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD) VALUES ('PI', 'Cajueiro da Praia', 2202083, 86);

-- Inserindo registros na tabela mc_bairro

INSERT INTO MC_BAIRRO (CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO) VALUES(1, 'Jardim Paulista', 'Oeste');
INSERT INTO MC_BAIRRO (CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO) VALUES(2, 'Jardim do Mar', 'Centro');
INSERT INTO MC_BAIRRO (CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO) VALUES(3, 'Santa EfigÃªnia', null);
INSERT INTO MC_BAIRRO (CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO) VALUES(4, 'Cascatinha', null);

--Inserindo registros na tabela mc_logradouro

INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(1, 'Alameda Campinas', 01404000);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(1, 'Alameda Lorena', 01424007);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(2, 'Avenida Senador Vergueiro', 09750001);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(2, 'Avenida Ã?ndico', 09750601);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(3, 'Rua Amoras', 30260140);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(3, 'Avenida do Contorno', 30110014);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(4, 'Rua Francisco Vaz de MagalhÃ£es', 36033340);
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP) VALUES(4, 'Rua Joaquim Carneiro Filho', 36033320);

--Inserindo registros na tabela mc_end_func
INSERT INTO MC_END_FUNC (
    CD_FUNCIONARIO,
    CD_LOGRADOURO,
    NR_END,
    DS_COMPLEMENTO_END,
    DT_INICIO,
    DT_TERMINO,
    ST_END) 
VALUES(1, 3, 2099, null, TO_DATE('19-12-2022', 'DD-MM-YYYY'), null, 'A');

INSERT INTO MC_END_FUNC (
    CD_FUNCIONARIO,
    CD_LOGRADOURO,
    NR_END,
    DS_COMPLEMENTO_END,
    DT_INICIO,
    DT_TERMINO,
    ST_END) 
VALUES(2, 1, 638, null, TO_DATE('14-08-2023', 'DD-MM-YYYY'), null, 'A');


--Inserindo registros na tabela mc_categoria_prod (categorias de produtos)

INSERT INTO MC_CATEGORIA_PROD(
    TP_CATEGORIA,
    DS_CATEGORIA,
    DT_INICIO,
    DT_TERMINO,
    ST_CATEGORIA
    )
VALUES('P', 'EletrÃ´nicos', null, null, 'A');

INSERT INTO MC_CATEGORIA_PROD(
    TP_CATEGORIA,
    DS_CATEGORIA,
    DT_INICIO,
    DT_TERMINO,
    ST_CATEGORIA
    )
VALUES('P', 'Esporte e Lazer', null, null, 'A');

INSERT INTO MC_CATEGORIA_PROD(
    TP_CATEGORIA,
    DS_CATEGORIA,
    DT_INICIO,
    DT_TERMINO,
    ST_CATEGORIA
    )
VALUES('P', 'Pet Shop', null, null, 'A');

--Inserindo registros na tabela mc_produto

INSERT INTO MC_PRODUTO(
    CD_CATEGORIA,
    NR_CD_BARRAS_PROD,
    DS_PRODUTO,
    VL_UNITARIO,
    TP_EMBALAGEM,
    ST_PRODUTO,
    VL_PERC_LUCRO,
    DS_COMPLETA_PROD
    )
VALUES(1, '846293756910', 'Notebool Dell Inspiron 15', 5879.99, null, 'A', null, 'Notebool Dell Inspiron 15 Intel Core i5 516MB SSD');

INSERT INTO MC_PRODUTO(
    CD_CATEGORIA,
    NR_CD_BARRAS_PROD,
    DS_PRODUTO,
    VL_UNITARIO,
    TP_EMBALAGEM,
    ST_PRODUTO,
    VL_PERC_LUCRO,
    DS_COMPLETA_PROD
    )
VALUES(1, '071654853147', 'IPhone 13 256GB', 3879.99, null, 'A', null, 'Apple IPhone 13 256GB Meia-Noite 5G Tela 6,1 CÃ¢m. Traseira 12+12MP Frontal 12MP');

INSERT INTO MC_PRODUTO(
    CD_CATEGORIA,
    NR_CD_BARRAS_PROD,
    DS_PRODUTO,
    VL_UNITARIO,
    TP_EMBALAGEM,
    ST_PRODUTO,
    VL_PERC_LUCRO,
    DS_COMPLETA_PROD
    )
VALUES(2, '54762558236', 'Bicicleta Aro 29 KRW Spotlight', 809.10, null, 'A', null, 'Bicicleta Aro 29 KRW Spotlight AlumÃ­nio 21 Velocidades Freio a Disco SX37');

INSERT INTO MC_PRODUTO(
    CD_CATEGORIA,
    NR_CD_BARRAS_PROD,
    DS_PRODUTO,
    VL_UNITARIO,
    TP_EMBALAGEM,
    ST_PRODUTO,
    VL_PERC_LUCRO,
    DS_COMPLETA_PROD
    )
VALUES(2, '784449566321', 'Raquete de TÃªnis Babolat Pure Aero 98', 1504.95, null, 'A', null, 'Raquete de TÃªnis Babolat Pure Aero 98 16X20 305G - 2023 - Carlos Alcaraz (L3 (4 3/8))');

INSERT INTO MC_PRODUTO(
    CD_CATEGORIA,
    NR_CD_BARRAS_PROD,
    DS_PRODUTO,
    VL_UNITARIO,
    TP_EMBALAGEM,
    ST_PRODUTO,
    VL_PERC_LUCRO,
    DS_COMPLETA_PROD
    )
VALUES(3, '455563214885', 'RaÃ§Ã£o Seca Felina Royal Canin Gastrointestinal Fibre Response 1.5kg', 288.99, null, 'A', null, 'RaÃ§Ã£o Seca Royal Canin Veterinary Diet Gastrointestinal Fibre Response Gatos com DoenÃ§as Intestinais');

--Inserindo registros na tabela mc_categoria_prod (categorias de vÃ­deos)

INSERT INTO MC_CATEGORIA_PROD(
    TP_CATEGORIA,
    DS_CATEGORIA,
    DT_INICIO,
    DT_TERMINO,
    ST_CATEGORIA
    )
VALUES('V', 'InstalaÃ§Ã£o do Produto', null, null, 'A');

INSERT INTO MC_CATEGORIA_PROD(
    TP_CATEGORIA,
    DS_CATEGORIA,
    DT_INICIO,
    DT_TERMINO,
    ST_CATEGORIA
    )
VALUES('V', 'Uso no cotidiano', null, null, 'A');

--Inserindo registros na tabela mc_sgv_produto_video

INSERT INTO MC_SGV_PRODUTO_VIDEO(
    CD_PRODUTO,
    NR_SEQUENCIA,
    CD_CATEGORIA,
    VD_PRODUTO,
    TP_VIDEO_PROD,
    DS_PATH_VIDEO_PROD,
    ST_VIDEO_PROD
    )
VALUES(3, 1, 4, null, 'mpeg4', 'https://drive.google.com/drive/folders/1PUCWIQA7qOFJPPvv/montagem.mpeg4','A');

INSERT INTO MC_SGV_PRODUTO_VIDEO(
    CD_PRODUTO,
    NR_SEQUENCIA,
    CD_CATEGORIA,
    VD_PRODUTO,
    TP_VIDEO_PROD,
    DS_PATH_VIDEO_PROD,
    ST_VIDEO_PROD
    )
VALUES(3, 2, 5, null, 'mpeg4', 'https://drive.google.com/drive/folders/1PUCWIQA7qOFJPPvv/usomarchas.mpeg4','A');

-- A) Cadastre no mï¿½nimo 1 CLIENTE PESSOA JURIDICA e 1 CLIENTE PESSOA FISICA (...)

-- Clientes
insert 
    into mc_cliente (
        nm_cliente,
        qt_estrelas,
        vl_medio_compra,
        st_cliente,
        ds_email,
        nr_telefone,
        nm_login,
        ds_senha
    ) 
    values (
        'Luiz Henrique Ribeiro Dos Santos Farias',
        9,
        1200.0,
        'A',
        'luizfariashot@outlook.com',
        '11-91234-5678',
        'luizisxt092',
        'senha123'
    );

insert 
    into mc_cliente (
        
        nm_cliente,
        qt_estrelas,
        vl_medio_compra,
        st_cliente,
        ds_email,
        nr_telefone,
        nm_login,
        ds_senha
    ) 
    values (
        'Victor Macedo',
        4,
        19000.23,
        'I',
        'victor_maceds@gmail.com',
        '11-94321-5678',
        'victosmad12',
        '123senha'
    );

insert 
    into mc_cliente (
        
        nm_cliente,
        qt_estrelas,
        vl_medio_compra,
        st_cliente,
        ds_email,
        nr_telefone,
        nm_login,
        ds_senha
    ) 
    values (
        'Gabriel Kruguer',
        0,
        null,
        'I',
        'gabs.krug@outlook.com',
        '11-92145-9978',
        'kruger219038',
        'sen123ha'
    );

-- Cliente pessoa fisica

insert 
    into mc_cli_fisica (
       nr_cliente, 
       dt_nascimento, 
       fl_sexo_biologico, 
       ds_genero, 
       nr_cpf
    )
    values (
        1,
        TO_DATE('03-03-2003', 'DD-MM-YYYY'),
        'M',
        null,
        12312345627       
    );
 
insert 
    into mc_cli_fisica (
       nr_cliente, 
       dt_nascimento, 
       fl_sexo_biologico, 
       ds_genero, 
       nr_cpf
    )
    values (
        2,
        TO_DATE('06-06-2005', 'DD-MM-YYYY'),
        'M',
        'Homem Cisgï¿½nero',
        56789012345       
    );

-- Cliente pessoa jurï¿½dica

insert 
    into mc_cli_juridica (
       nr_cliente, 
       dt_fundacao, 
       nr_cnpj, 
       nr_inscr_est
    )
    values (
        3,
        TO_DATE('13-12-2016', 'DD-MM-YYYY'),
        01410663000147,
        null 
    );  


-- A) (...) A partir dos dados cadastrados nas tabelas estado, cidade e bairro, cadastre no mï¿½nimo 1 endereï¿½o para cada cliente.


insert into mc_end_cli (
    nr_cliente,
    cd_logradouro_cli,
    nr_end,
    ds_complemento_end,
    dt_inicio,
    dt_termino,
    st_end
) values (
    1,
    2,
    575,
    'Prï¿½ximo ï¿½ igreja e da loja de convï¿½niencia do paulo',
    to_date('09-01-2016', 'DD-MM-YYYY'),
    null,
    'A'
);

insert into mc_end_cli (
    nr_cliente,
    cd_logradouro_cli,
    nr_end,
    ds_complemento_end,
    dt_inicio,
    dt_termino,
    st_end
) values (
    2,
    7,
    23,
    'Condomï¿½nio Videiras Bloco 42, Apt_a23',
    to_date('09-01-2012', 'DD-MM-YYYY'),
    null,
    'A'
);

insert into mc_end_cli (
    nr_cliente,
    cd_logradouro_cli,
    nr_end,
    ds_complemento_end,
    dt_inicio,
    dt_termino,
    st_end
) values (
    3,
    8,
    1100,
    'hï¿½ dois quarteirï¿½es do MC Donalds',
    to_date('02-07-2022', 'DD-MM-YYYY'),
    to_date('14-01-2024', 'DD-MM-YYYY'),
    'I'
);


-- B) Cadastre um novo cliente que ja tenha um mesmo loguin jï¿½ criado. Foi possï¿½vel incluir esse novo cliente? Explique:
insert into mc_cliente (
    nm_cliente,
    qt_estrelas,
    vl_medio_compra,
    st_cliente,
    ds_email,
    nr_telefone,
    nm_login,
    ds_senha
) VALUES (
    'Victor SantosMacedo',
    4,
    19000.23,
    'A',
    'victor_maceds@gmail.com',
    '11-90807-2345',
    'victosmad12',
    '12345678'
);
-- Output: ORA-00001: restriï¿½ï¿½o exclusiva (RM559962.UK_MC_CLIENTE_MM_LOGIN) violada
-- R: O banco de dados nï¿½o permite pois hï¿½ uma restriï¿½ï¿½o exclusiva do campo de login, no qual cada login deve ser ï¿½nico no sistema.


-- ALTERAÇÃO DE DADOS

-- c) Selecione um específico funcionário e atualize o Cargo e aplique 12% de aumento de salário

-- Atualiza o cargo para o vendedor III e Aplica a atualizaÃ§Ã£o para o funcionÃ¡rio com ID 3

UPDATE mc_funcionario
SET
    ds_cargo = 'Vendedor(a) III',
    vl_salario = vl_salario * 1.12
WHERE
    cd_funcionario = 3; 

-- d)selecione um endereço de cliente e coloque o status como I(nativo) e preencha a data de término como sendo a data 
-- limite de entrega dotrabalho na plataforma da Fiap. Utilize a funçao to_date para registrar esse novo valor de data.

-- Define o status como Inativo e data de término para 14 de outubro de 2024
UPDATE mc_end_cli
SET
    st_end = 'I',
    dt_termino = TO_DATE('2024-10-24', 'YYYY-MM-DD')
WHERE
    nr_cliente = 2;  

-- e) Tende eliminar um estado que tenha uma cidade cadastrada. Isso foi possível? Explique.
DELETE 
FROM mc_estado
WHERE
    sg_estado = 'SP';
-- Output: ORA-02292: restrição de integridade (RM559962.FK_MC_CIDADE_ESTADO) violada - registro filho localizado
-- R: Não é possível excluír um registro em que sua chave primária esteja associada a uma chave estrangeira em outra tabela, por conta da restrição de integridade imposta pelo banco.


-- f) selecione um produto e tente atualizar o status do produto com o status x. Isso foi possível? justifique o motivo.
UPDATE mc_produto
SET
    st_produto = 'X'
WHERE
    cd_produto = 3;
-- Output: ORA-02290: restrição de verificação (RM559962.MC_PRODUTO_CK_ST_PROD) violada
-- R) Não é possível atualizar o status para "X" pois uma restrição conteúdo foi imposta ao campo st_produto, no qual é aceito apenas "A" de ativ e "I" de inativo.

-- g) Confirme todas as transações pendentes
COMMIT;


--Inserindo registros na tabela mc_sgv_visualizacao_video

INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (
    NR_CLIENTE,
    CD_PRODUTO,
    NR_SEQUENCIA,
    DT_VISUALIZACAO,
    NR_HORA_VISUALIZACAO,
    NR_MINUTO_VIDEO,
    NR_SEGUNDO_VIDEO
    )
VALUES(1, 3, 1, TO_DATE('14-04-2024', 'DD-MM-YYYY'), 19, 31, 23);

INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (
    NR_CLIENTE,
    CD_PRODUTO,
    NR_SEQUENCIA,
    DT_VISUALIZACAO,
    NR_HORA_VISUALIZACAO,
    NR_MINUTO_VIDEO,
    NR_SEGUNDO_VIDEO
    )
VALUES(1, 3, 2, TO_DATE('14-04-2024', 'DD-MM-YYYY'), 19, 35, 19);



-- Confirmando as insercoes
COMMIT;