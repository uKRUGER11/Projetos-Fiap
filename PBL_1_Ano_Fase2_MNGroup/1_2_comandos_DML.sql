

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
-- 1 linha inserido.

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
-- 1 linha inserido.

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
-- 1 linha inserido.

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
 -- 1 linha inserido.

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
-- 1 linha inserido.

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
-- 1 linha inserido.


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
-- 1 linha inserido.

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
-- 1 linha inserido.

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
-- 1 linha inserido.


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
-- 1 linha inserido.

-- d)selecione um endereço de cliente e coloque o status como I(nativo) e preencha a data de término como sendo a data 
-- limite de entrega do trabalho (14 de outubro de 2024) na plataforma da Fiap. Utilize a funçao to_date para registrar esse novo valor de data.

-- Define o status como Inativo e data de término para 
UPDATE mc_end_cli
SET
    st_end = 'I',
    dt_termino = TO_DATE('2024-10-24', 'YYYY-MM-DD')
WHERE
    nr_cliente = 2;  
-- 1 linha inserido.

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