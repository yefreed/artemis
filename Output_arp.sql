                                                                                                                                             
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY] = 'Gas OTC Purchase' and b.name in (   'CT_UK_GAS_FS' , 'CT_CH_GAS_FS' , 'CT_CZ_GAS_COOP' , 'CT_DE_GAS_TRAD' , 'CT_FR_GAS_TRAD' , 'CT_UK_PWR_OPTIM' , 'G_EUR_ST' , 'G_EUR_STOR' , 'G_TRAD_EXEC' , 'G_TRAD_STOR' , 'GAS_EUR_AB' , 'GAS_EUR_CAPA_COMM' , 'GAS_EUR_CEE_ORIG' , 'GAS_EUR_CURVE' , 'GAS_EUR_CURVE' , 'GAS_EUR_EUROPE' , 'GAS_EUR_INDEX' , 'GAS_EUR_PROP' , 'GAS_EUR_SPEC' , 'GAS_EUR_STRAT' , 'GAS_HUB_SLEEVE' , 'GAS_HUB_SLEEVE' , 'GTR_GAS_LTC_HEDGE' , 'GTR_LNG_GAS' , 'LTCD_GAS_H' , 'M_ITA_CSH' , 'CT_BNL_GAS_FS' , 'CT_AT_GAS_TRAD' , 'UK_GAS_TRAD' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Green Certificates' and b.name in (   'CO_CH_GRN_EXTSRC' , 'M_EUR_GD_HDG' , 'M_GD_TRAD' , 'GD_ORI_TR' , 'CT_UK_PWR_FS' , 'CO_CH_GRN_EXTSRC' , 'CT_PL_SET_RW' , 'CO_CH_GRN_INTSRC' , 'CO_CH_GRN_INTSRC' , 'CT_FR_GAS_TRAD' , 'GD_ORI_TR' , 'CT_PL_TRAD' , 'GD_ORI_OU' , 'CT_BNL_B2B' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Exchange Futures Contract' and b.name in (   'S_ESP_PROP' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Financial Swap' and b.name in (   'ST_TR_PWR_TRAD' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Physical' and b.name in (   'CFT_STR_LS_HA' , 'CEE_PWR_TS1' , 'CFT_AST_TERMIN_HA' , 'CFT_AST_TERMIN_EIGEN' , 'CFT_AST_TERMIN_HA_N' , 'CFT_AST_TERMIN_HA_PH' , 'CFT_AST_TERMIN_PROP' , 'CFT_AST_TERMIN_TRAD' , 'CFT_AST_TEAM_TRAD' , 'CEE_LO_XBO' , 'CEE_LO_MGMT' , 'GXB_PWR_SRB' , 'PWR_SYS_TS1' , 'PWR_EXE_GERFRA_JEK' , 'PWR_DIR_TS1' , 'P_FRA_PROP' , 'P_FRA_ORIG' , 'P_EUR_XB' , 'GXB_PWR_SEE' , 'P_EUR_STP_OPT' , 'P_EUR_PROP' , 'MGMT_ORI_RW' , 'M_ITA_XB_TRAD' , 'M_ITA_XB_OPTI' , 'M_ITA_XB' , 'CFT_STR_DYNKU_TR_HDG' , 'P_EUR_STP' , 'CFT_STR_DYNLT_TR_HDG' , 'CFT_AST_TERMIN_TR_HDG' , 'CT_FR_RW' , 'CFT_STR_DYNSTRU_TR' , 'CT_CZ_PWR_COOP' , 'CT_PL_RW' , 'CT_PL_SET_RW' , 'CFT_STR_LS_TR_HDG' , 'CST_TRD_SPEC_SHORTTRM' , 'CT_UK_PWR_CAP_BRITN' , 'CFT_STR_DYNTRA_TR' , 'CT_BNL_STP_TRAD' , 'CT_UK_PWR_OPTIM' , 'CT_AT_PWR_TRAD' , 'CFT_STR_LS_HA_PH' , 'CT_BNL_PWR_TRAD' , 'CT_CH_PWR_STP_TRAD' , 'COLLAB_TRAD' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Trayport Forward' and b.name in (   'P_EUR_STP' , 'CFT_STR_DYNVOLA_TR' , 'P_EUR_STP_OPT' , 'CT_BNL_PWR_TRAD' , 'CFT_STR_LS_TR_HDG' , 'P_EUR_PROP' , 'P_FRA_PROP' , 'P_STP_OPTQM' , 'PWR_DIR_TS1' , 'PWR_DIR_TS2' , 'PWR_DIR_TS3' , 'CFT_STR_LS_OU' , 'CFT_STR_LS_HA_PH' , 'CFT_STR_LS_HA' , 'P_EUR_XB' , 'CFT_STR_DYNTRA_TR' , 'CBL_AST_ABPM' , 'P_DIR_POWER' , 'CFT_STR_DYNLT_TR_HDG' , 'CFT_STR_DYNKU_TR_HDG' , 'CT_UK_PWR_OPTIM' , 'CEE_LO_MGMT' , 'CFT_AST_TERMIN_TRAD' , 'CFT_AST_TERMIN_TR_HDG' , 'CFT_STR_DYNOPT_TR_HDG' , 'CT_UK_PWR_FS' , 'STR_EUR_STR_OPT' , 'CFT_STR_DYNSTRU_TR' , 'CT_PL_RW' , 'CFT_AST_TEAM_TRAD' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Trayport Spot' and b.name in (   'P_STP_OPTQM' , 'P_FRA_PROP' , 'CEE_LO_MGMT' , 'CFT_STR_DYNSTRU_TR' , 'P_DIR_POWER' , 'CT_UK_PWR_OPTIM' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Yearly Call Option' and b.name in (   'CT_CZ_PWR_COOP' , 'P_EUR_STP_OPT' , 'CT_CH_PWR_STP_TRAD' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
      
 
 
  
        SELECT d.deal_id, 
        b.name book 
        ,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) cflow_type  
        ,[ORIG_INSTRUMENT_KEY]        
        ,[CURRENCY_KEY]  
        ,ROund(sum([NV_CC]),2) nv_cc  
        FROM [DM_MOR].[Fact_CashAndVolumes_ccy4] c  
        inner join dwh.dim_pos_deal_book b on (b.id = c.BOOK_ID)  
          inner join dwh.dim_pos_deal d on (d.id = c.DEAL_ID)  
          where (c.load_id = 2016091901  
          or c.load_id = 2016091923  
          or c.load_id = 2016091925)  
           and delivery_realisation_id in (0,1,2,3,7,9, 4,8)  
          and DATA_SELECTION_ID = 0  
         and [CASHFLOW_TYPE_KEY] in ('Broker Fee#OFFICIAL', 'Broker Fee (Manuell)#OFFICIAL', 'Clearing Fee#OFFICIAL', 'Clearing Member Fee#OFFICIAL', 'Courtage#OFFICIAL', 'DW BrokerFee (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ClearingFeeRefund (Manuell)#OFFICIAL', 'EEX ExecutionFee (Manuell)#OFFICIAL', 'EEX ExecutionFeeRefund (Manuell)#OFFICIAL', 'EEX VariationMargin (Manuell)#OFFICIAL', 'Execution Fee#OFFICIAL', 'PNL Transfer (Manuell)#OFFICIAL', 'Spezielle Entgelte#OFFICIAL', 'Spezielle Entgelte (Manuell)#OFFICIAL', 'Upfront#OFFICIAL', 'Variation Margin#OFFICIAL') 
         and [NV_CC] is not NULL and NV_CC <> 0 
         and left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) = 'Broker Fee'
     and [ORIG_INSTRUMENT_KEY]  = 'Power Yearly Put Option' and b.name in (   'CT_CZ_PWR_COOP' , 'CFT_STR_DYNVOLA_TR' , 'P_EUR_STP_OPT' group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
    