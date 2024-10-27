-- a) Criação do cursor que exibe os dados que serão usados para popular a tabela mc_sgv_ocorrencia_sac

declare
    ocorrencia mc_sgv_ocorrencia_sac%rowtype;
    v_DS_TIPO_CLASSIFICACAO_SAC varchar(30);
    v_vl_unitario_lucro number (8,2);
    CURSOR cr_ocor IS
        select
            sc.nr_sac, sc.dt_abertura_sac, sc.hr_abertura_sac, sc.tp_sac,
            prod.cd_produto, prod.ds_produto, prod.vl_unitario, prod.vl_perc_lucro,
            cli.nr_cliente, cli.nm_cliente, 
            cli_es.sg_estado, cli_es.nm_estado
        from mc_sgv_sac sc                     
        inner join mc_produto prod on (sc.cd_produto = prod.cd_produto)
         inner join mc_cliente cli on (sc.nr_cliente = cli.nr_cliente)
            inner join (select ed.nr_cliente, lg.cd_logradouro, br.cd_bairro,
                               cd.cd_cidade, es.sg_estado, es.nm_estado
                            from mc_end_cli ed
                            inner join mc_logradouro lg on (ed.CD_LOGRADOURO_CLI = lg.CD_LOGRADOURO)
                                inner join mc_bairro br on (lg.cd_bairro = br.cd_bairro)
                                    inner join mc_cidade cd on (br.cd_cidade = cd.cd_cidade)
                                        inner join mc_estado es on (cd.sg_estado = es.sg_estado)) cli_es on (cli.nr_cliente = cli_es.nr_cliente);
                                 
begin
    
    for ocorrencia in cr_ocor loop
        
        dbms_output.put_line('Número do SAC: ' ||  ocorrencia.nr_sac);
        dbms_output.put_line('Data de abertura do SAC: ' ||  ocorrencia.dt_abertura_sac);
        dbms_output.put_line('Hora de abertura do SAC: ' ||  ocorrencia.hr_abertura_sac);
        dbms_output.put_line('Tipo do SAC: ' ||  ocorrencia.tp_sac);
        dbms_output.put_line('Código do Produto relacionado ao SAC: ' ||  ocorrencia.cd_produto);
        dbms_output.put_line('Nome do produto relacionado ao SAC: ' ||  ocorrencia.ds_produto);
        dbms_output.put_line('Valor unitário produto relacionado ao SAC: ' ||  ocorrencia.vl_unitario);
        dbms_output.put_line('Valor percentual de lucro do produto relacionado ao SAC: ' ||  ocorrencia.vl_perc_lucro);
        dbms_output.put_line('Número do cliente associado ao SAC: ' ||  ocorrencia.nr_cliente);
        dbms_output.put_line('Nome do Cliente associado ao SAC: ' ||  ocorrencia.nm_cliente);
        dbms_output.put_line('Sigla do estado relacionado ao cliente: ' ||  ocorrencia.sg_estado);
        dbms_output.put_line('Estado relacionado ao cliente: ' ||  ocorrencia.nm_estado);
        
        EXIT WHEN cr_ocor%notfound;
    -- Inserindo os dados na tabela mc_sgv_ocorrencia_sac
        INSERT INTO mc_sgv_ocorrencia_sac (
            nr_ocorrencia_sac, 
            dt_abertura_sac, 
            hr_abertura_sac, 
            ds_tipo_classificacao_sac,
            DS_INDICE_SATISFACAO_ATD_SAC, 
            CD_PRODUTO, 
            DS_PRODUTO, 
            VL_UNITARIO_PRODUTO, 
            VL_PERC_LUCRO,
            VL_UNITARIO_LUCRO_PRODUTO, 
            SG_ESTADO, 
            NM_ESTADO, 
            NR_CLIENTE, 
            NM_CLIENTE,
            VL_ICMS_PRODUTO
        ) VALUES (
            ocorrencia.nr_sac, 
            ocorrencia.dt_abertura_sac, 
            ocorrencia.hr_abertura_sac, 
            'teste', 
            null, 
            ocorrencia.cd_produto, 
            ocorrencia.ds_produto, 
            ocorrencia.vl_unitario, 
            v_vl_unitario_lucro, 
            null, 
            ocorrencia.sg_estado, 
            ocorrencia.nm_estado,
            ocorrencia.nr_cliente, 
            ocorrencia.nm_cliente, 
            null
        );
        END LOOP;

end;


Select * from mc_sgv_ocorrencia_sac;












