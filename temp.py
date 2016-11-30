# -*- coding: utf-8 -*-


import pandas as pd
import numpy as np
import scipy as sp

df = (pd.read_csv('C:/Users/YEFRDITT/.spyder-py3/difs.csv')[['book','ORIG_INSTRUMENT_KEY']]
    .sort_values(['ORIG_INSTRUMENT_KEY'] )
    .set_index(['ORIG_INSTRUMENT_KEY'])
    .groupby(level = 0 )
    )

sql_artemis_header = '''with mdfl as ( 
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
        and cf.name = 'Broker Fee' '''

sql_artemis_footer = ''' ) 
        group by ff.deal_num, cf.name, i.longname, p.name, c.name 
        order by ff.deal_num, cf.name, i.longname, p.name, c.name '''
        
sql_arp_header = '''
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
    '''

sql_arp_footer = ''')
        group by d.deal_id,left([CASHFLOW_TYPE_KEY],len([CASHFLOW_TYPE_KEY])-9) ,[ORIG_INSTRUMENT_KEY] ,b.name ,[CURRENCY_KEY] 
        order by d.deal_id,cflow_type,[ORIG_INSTRUMENT_KEY],b.name ,[CURRENCY_KEY]
    '''

sql_artemis = ""
sql_arp = ""

for name, group in df:
    if len(sql_artemis) > 0:
        sql_artemis = " %s %s %s and i.longname = '%s' and p.name in ( " % ( sql_artemis, ' \n \n \n ', sql_artemis_header, name)
        sql_arp = " %s %s %s and [ORIG_INSTRUMENT_KEY]  = '%s' and b.name in ( " % ( sql_arp, ' \n \n \n ', sql_arp_header, name)
    else:
        sql_artemis = " %s and i.longname = '%s' and p.name in ( " % (sql_artemis_header,name)
        sql_arp = " %s and [ORIG_INSTRUMENT_KEY] = '%s' and b.name in ( " % (sql_arp_header,name)
    for row in range(0,len(group)):        
        sql_artemis = " %s %s '%s'" % ( sql_artemis , ","  if row > 0 else "" , group.iloc[row]['book'])
        sql_arp = " %s %s '%s'" % ( sql_arp , ","  if row > 0 else "" , group.iloc[row]['book'])
    sql_artemis = '%s %s' % (sql_artemis, sql_artemis_footer)
    sql_arp = '%s %s' % (sql_arp, sql_arp_footer)

text_file = open("Output_artemis.sql", "w")
text_file.write(sql_artemis)
text_file.close()

text_file = open("Output_arp.sql", "w")
text_file.write(sql_arp)
text_file.close()

#def retrieve_sql_artemis(pfolio,rows):
#    global sql_artemis_header
#    global sql_artemis_footer
#    sql_artemis = ""
#    sql_artemis = " %s and p.name = ' %s ' and i.longname in ( " % (sql_artemis_header,sql_artemis)
#    
#    for row in range(0,rows.count[0]):
#        sql_artemis = ' %s %s %s' % ( sql_artemis , "," , rows.iloc[row]['ORIG_INSTRUMENT_KEY'])
#    
#    return ' %s %s' % (sql_artemis, sql_artemis_footer)
#
#for book, group in df:
#        sql_artemis = '%s %s %s' % (sql_artemis, ' \n UNION \n ', retrieve_sql_artemis(book, group))
#        
#print(sql_artemis)



    


         
    