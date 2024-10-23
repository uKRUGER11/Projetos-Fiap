declare
    ocorrencia mc_sgv_ocorrencia_sac%rowtype;
    CURSPR cr_ocor IS
        select
            sc.nr_sac, sc.dt_abertura_sac, sc.hr_abertura_sac, sc.tp_sac,
            prod.cd_produto, prod.ds_produto, prod.vl_unitario, prod.vl_perc_lucro,
            cli.nr_cliente, cli.nm_cliente, cli_es.sg_estado, cli_es.nm_estado
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


end;




