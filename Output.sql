                                                                                                                                             with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Gas OTC Purchase' and p.name in (   'CT_UK_GAS_FS' , 'CT_CH_GAS_FS' , 'CT_CZ_GAS_COOP' , 'CT_DE_GAS_TRAD' , 'CT_FR_GAS_TRAD' , 'CT_UK_PWR_OPTIM' , 'G_EUR_ST' , 'G_EUR_STOR' , 'G_TRAD_EXEC' , 'G_TRAD_STOR' , 'GAS_EUR_AB' , 'GAS_EUR_CAPA_COMM' , 'GAS_EUR_CEE_ORIG' , 'GAS_EUR_CURVE' , 'GAS_EUR_CURVE' , 'GAS_EUR_EUROPE' , 'GAS_EUR_INDEX' , 'GAS_EUR_PROP' , 'GAS_EUR_SPEC' , 'GAS_EUR_STRAT' , 'GAS_HUB_SLEEVE' , 'GAS_HUB_SLEEVE' , 'GTR_GAS_LTC_HEDGE' , 'GTR_LNG_GAS' , 'LTCD_GAS_H' , 'M_ITA_CSH' , 'CT_BNL_GAS_FS' , 'CT_AT_GAS_TRAD' , 'UK_GAS_TRAD'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Green Certificates' and p.name in (   'CO_CH_GRN_EXTSRC' , 'M_EUR_GD_HDG' , 'M_GD_TRAD' , 'GD_ORI_TR' , 'CT_UK_PWR_FS' , 'CO_CH_GRN_EXTSRC' , 'CT_PL_SET_RW' , 'CO_CH_GRN_INTSRC' , 'CO_CH_GRN_INTSRC' , 'CT_FR_GAS_TRAD' , 'GD_ORI_TR' , 'CT_PL_TRAD' , 'GD_ORI_OU' , 'CT_BNL_B2B'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Exchange Futures Contract' and p.name in (   'S_ESP_PROP'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Financial Swap' and p.name in (   'ST_TR_PWR_TRAD'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Physical' and p.name in (   'CFT_STR_LS_HA' , 'CEE_PWR_TS1' , 'CFT_AST_TERMIN_HA' , 'CFT_AST_TERMIN_EIGEN' , 'CFT_AST_TERMIN_HA_N' , 'CFT_AST_TERMIN_HA_PH' , 'CFT_AST_TERMIN_PROP' , 'CFT_AST_TERMIN_TRAD' , 'CFT_AST_TEAM_TRAD' , 'CEE_LO_XBO' , 'CEE_LO_MGMT' , 'GXB_PWR_SRB' , 'PWR_SYS_TS1' , 'PWR_EXE_GERFRA_JEK' , 'PWR_DIR_TS1' , 'P_FRA_PROP' , 'P_FRA_ORIG' , 'P_EUR_XB' , 'GXB_PWR_SEE' , 'P_EUR_STP_OPT' , 'P_EUR_PROP' , 'MGMT_ORI_RW' , 'M_ITA_XB_TRAD' , 'M_ITA_XB_OPTI' , 'M_ITA_XB' , 'CFT_STR_DYNKU_TR_HDG' , 'P_EUR_STP' , 'CFT_STR_DYNLT_TR_HDG' , 'CFT_AST_TERMIN_TR_HDG' , 'CT_FR_RW' , 'CFT_STR_DYNSTRU_TR' , 'CT_CZ_PWR_COOP' , 'CT_PL_RW' , 'CT_PL_SET_RW' , 'CFT_STR_LS_TR_HDG' , 'CST_TRD_SPEC_SHORTTRM' , 'CT_UK_PWR_CAP_BRITN' , 'CFT_STR_DYNTRA_TR' , 'CT_BNL_STP_TRAD' , 'CT_UK_PWR_OPTIM' , 'CT_AT_PWR_TRAD' , 'CFT_STR_LS_HA_PH' , 'CT_BNL_PWR_TRAD' , 'CT_CH_PWR_STP_TRAD' , 'COLLAB_TRAD'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Trayport Forward' and p.name in (   'P_EUR_STP' , 'CFT_STR_DYNVOLA_TR' , 'P_EUR_STP_OPT' , 'CT_BNL_PWR_TRAD' , 'CFT_STR_LS_TR_HDG' , 'P_EUR_PROP' , 'P_FRA_PROP' , 'P_STP_OPTQM' , 'PWR_DIR_TS1' , 'PWR_DIR_TS2' , 'PWR_DIR_TS3' , 'CFT_STR_LS_OU' , 'CFT_STR_LS_HA_PH' , 'CFT_STR_LS_HA' , 'P_EUR_XB' , 'CFT_STR_DYNTRA_TR' , 'CBL_AST_ABPM' , 'P_DIR_POWER' , 'CFT_STR_DYNLT_TR_HDG' , 'CFT_STR_DYNKU_TR_HDG' , 'CT_UK_PWR_OPTIM' , 'CEE_LO_MGMT' , 'CFT_AST_TERMIN_TRAD' , 'CFT_AST_TERMIN_TR_HDG' , 'CFT_STR_DYNOPT_TR_HDG' , 'CT_UK_PWR_FS' , 'STR_EUR_STR_OPT' , 'CFT_STR_DYNSTRU_TR' , 'CT_PL_RW' , 'CFT_AST_TEAM_TRAD'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Trayport Spot' and p.name in (   'P_STP_OPTQM' , 'P_FRA_PROP' , 'CEE_LO_MGMT' , 'CFT_STR_DYNSTRU_TR' , 'P_DIR_POWER' , 'CT_UK_PWR_OPTIM'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Yearly Call Option' and p.name in (   'CT_CZ_PWR_COOP' , 'P_EUR_STP_OPT' , 'CT_CH_PWR_STP_TRAD'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name   
 
 
  with mdfl as ( 
        select max(ID) as ID, ReportingDate, source_short, package, PackageItem 
        from LAK.MetaDataForLoad 
        where LoadEnd_UTC is not null 
        group by ReportingDate, source_short, package, PackageItem 
        ) 
        select left(ff.deal_num,len(ff.deal_num)-6) deal_num, p.name as book, cf.name as cf_type
        , i.longname as ins_type, c.name as currency, sum(position) amount
        from CALC.Fact_Finance_Cash_pre ff 
        inner join mdfl as mdfl_ff on (mdfl_ff.package = 'Fact_Finance_Cash_pre' 
                                       and mdfl_ff.ReportingDate = ff.__ReportingDate__ 
                                       and mdfl_ff.PackageItem = convert(varchar(100),ff.book) 
                                       and ff.__LoadMetaData_ID__ = mdfl_ff.ID) 
        inner join RAW_ENDUR.instruments i on (i.id_number = ff.ins_type) 
        inner join RAW_ENDUR.portfolio p on (p.id_number = ff.book) 
        inner join RAW_ENDUR.currency c on (c.id_number = ff.currency_id) 
        inner join RAW_ENDUR.cflow_type cf on (cf.id_number = ff.cflow_type) 
        where ff.__ReportingDate__ = '2016-09-19' 
        and cf.name = 'Broker Fee'  and i.longname = 'Power Yearly Put Option' and p.name in (   'CT_CZ_PWR_COOP' , 'CFT_STR_DYNVOLA_TR' , 'P_EUR_STP_OPT'  ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name 