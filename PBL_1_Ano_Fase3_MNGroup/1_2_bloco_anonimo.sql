Delete from mc_sgv_ocorrencia_sac where nr_ocorrencia_sac =1;
set serveroutput on;
DECLARE
    -- Define o tipo de variável para armazenar cada linha do cursor
    ocorrencia mc_sgv_ocorrencia_sac%ROWTYPE;

    -- Declaração do cursor
    CURSOR cr_ocor IS
        SELECT
            sc.nr_sac, sc.dt_abertura_sac, sc.hr_abertura_sac, sc.tp_sac,
            prod.cd_produto, prod.ds_produto, prod.vl_unitario, prod.vl_perc_lucro,
            cli.nr_cliente, cli.nm_cliente, 
            cli_es.sg_estado, cli_es.nm_estado
        FROM mc_sgv_sac sc                     
        INNER JOIN mc_produto prod ON sc.cd_produto = prod.cd_produto
        INNER JOIN mc_cliente cli ON sc.nr_cliente = cli.nr_cliente
        INNER JOIN (
            SELECT ed.nr_cliente, lg.cd_logradouro, br.cd_bairro,
                   cd.cd_cidade, es.sg_estado, es.nm_estado
            FROM mc_end_cli ed
            INNER JOIN mc_logradouro lg ON ed.CD_LOGRADOURO_CLI = lg.CD_LOGRADOURO
            INNER JOIN mc_bairro br ON lg.cd_bairro = br.cd_bairro
            INNER JOIN mc_cidade cd ON br.cd_cidade = cd.cd_cidade
            INNER JOIN mc_estado es ON cd.sg_estado = es.sg_estado
        ) cli_es ON cli.nr_cliente = cli_es.nr_cliente;
        
    -- Variável auxiliar para a classificação do SAC
    v_ds_tipo_classificacao_sac VARCHAR2(30);
    -- Variável para armazenar o valor do lucro unitário
    v_vl_unitario_lucro_produto NUMBER(10, 2);
    -- Variável para armazenar o valor do icms do produto:
    vl_icms_produto NUMBER(10, 2);

BEGIN
    
    -- Itera sobre o cursor
    FOR ocorrencia IN cr_ocor LOOP
        EXIT WHEN cr_ocor%notfound; 

        -- Classificação do SAC
        IF ocorrencia.tp_sac = 'S' THEN
            v_ds_tipo_classificacao_sac := 'SUGESTÃO';
        ELSIF ocorrencia.tp_sac = 'D' THEN
            v_ds_tipo_classificacao_sac := 'DÚVIDA';
        ELSIF ocorrencia.tp_sac = 'E' THEN
            v_ds_tipo_classificacao_sac := 'ELOGIO';
        ELSE
            v_ds_tipo_classificacao_sac := 'CLASSIFICAÇÃO INVÁLIDA';
        END IF;

        -- Calcula o valor do lucro unitário
        v_vl_unitario_lucro_produto := ocorrencia.vl_unitario * (ocorrencia.vl_perc_lucro / 100);

        -- insere os dados na tabela de ocorrencia
            INSERT INTO mc_sgv_ocorrencia_sac (
                nr_ocorrencia_sac,
                dt_abertura_sac,
                hr_abertura_sac,
                ds_tipo_classificacao_sac,
                cd_produto,
                ds_produto,
                vl_unitario_produto,
                vl_perc_lucro,
                vl_unitario_lucro_produto,
                sg_estado,
                nm_estado,
                nr_cliente,
                nm_cliente,
                vl_icms_produto -- Mantém o valor nulo
            )
            VALUES (
                ocorrencia.nr_sac,
                ocorrencia.dt_abertura_sac,
                ocorrencia.hr_abertura_sac,
                v_ds_tipo_classificacao_sac,
                ocorrencia.cd_produto,
                ocorrencia.ds_produto,
                ocorrencia.vl_unitario,
                ocorrencia.vl_perc_lucro,
                v_vl_unitario_lucro_produto,
                ocorrencia.sg_estado,
                ocorrencia.nm_estado,
                ocorrencia.nr_cliente,
                ocorrencia.nm_cliente,
                NULL -- vl_icms_produto permanece vazio
            );
            
            dbms_output.put_line('Número do SAC: ' ||  ocorrencia.nr_sac);
            dbms_output.put_line('Data de abertura do SAC: ' ||  ocorrencia.dt_abertura_sac);
            dbms_output.put_line('Hora de abertura do SAC: ' ||  ocorrencia.hr_abertura_sac);
            dbms_output.put_line('Tipo do SAC: ' ||  ocorrencia.tp_sac);
            dbms_output.put_line('___________________________________________________________________________________________');
            dbms_output.put_line('* Tipo de classificação SAC (dado tranformado): ' ||  v_ds_tipo_classificacao_sac || '*');
            dbms_output.put_line('___________________________________________________________________________________________');
            dbms_output.put_line('Código do Produto relacionado ao SAC: ' ||  ocorrencia.cd_produto);
            dbms_output.put_line('Nome do produto relacionado ao SAC: ' ||  ocorrencia.ds_produto);
            dbms_output.put_line('Valor unitário produto relacionado ao SAC: ' ||  ocorrencia.vl_unitario);
            dbms_output.put_line('Valor percentual de lucro do produto relacionado ao SAC: ' ||  ocorrencia.vl_perc_lucro);
            dbms_output.put_line('___________________________________________________________________________________________');
            dbms_output.put_line('* Valor unitário de lucro do produto relacionado ao SAC: ' ||  v_vl_unitario_lucro_produto || '*');
            dbms_output.put_line('___________________________________________________________________________________________');
            dbms_output.put_line('Número do cliente associado ao SAC: ' ||  ocorrencia.nr_cliente);
            dbms_output.put_line('Nome do Cliente associado ao SAC: ' ||  ocorrencia.nm_cliente);
            dbms_output.put_line('Sigla do estado relacionado ao cliente: ' ||  ocorrencia.sg_estado);
            dbms_output.put_line('Estado relacionado ao cliente: ' ||  ocorrencia.nm_estado);

  
    END LOOP;
    
END;
/



commit;


