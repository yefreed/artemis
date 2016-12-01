# -*- coding: utf-8 -*-
"""
Created on Wed Nov 30 16:55:05 2016

@author: YEFRDITT
"""

import pandas as pd
import numpy as np
import scipy as sp
import artemis_functions as art

home_path = 'C:/Users/YEFRDITT/OneDrive/Axpo/ARTEMIS/'
cf_type = 'Broker Fee'
cnxnstr_art = "DRIVER={SQL Server Native Client 11.0};ApplicationIntent=READONLY;DATABASE=ARTEMIS_YG2;Trusted_Connection=Yes;SERVER=ARTEMIS_DB_TEST\ARTEMIS"
cnxnstr_arp = "DRIVER={SQL Server Native Client 11.0};ApplicationIntent=READONLY;DATABASE=ARP;Trusted_Connection=Yes;SERVER=ARP_DB_PROD"
summary = 'Start \n'
print(summary)

dfi = (pd.read_csv('%sdifs.csv' % (home_path))[['book','ORIG_INSTRUMENT_KEY']]
    .sort_values(['ORIG_INSTRUMENT_KEY'] )
    .set_index(['ORIG_INSTRUMENT_KEY'])
    #.groupby(level = 0 )
    )

df = dfi.groupby(level=0)
df_all = None

for name, group in df:
    print('Processing instrument type %s Cashflow type %s' % ( name, cf_type))
    summary = ' %s \nProcessing instrument type %s Cashflow type %s' % (summary, name, cf_type)
    sql_art, sql_arp, sub_summary = art.get_art_sql(name, group, cf_type);
    summary = '%s\n%s\nSQL ARTEMIS:\n%s\nSQL ARP:\n%s' % (summary, sub_summary, sql_art, sql_arp)
    df_art = art.retrieve_data_from_database(cnxnstr_art,sql_art)
    df_arp = art.retrieve_data_from_database(cnxnstr_arp,sql_arp)
    df_comp, sub_summary = art.compare_systems(df_arp,df_art)
    if df_all is None:
        df_all = df_comp.copy()
    else:
        df_all = pd.concat([df_all,df_comp])    
    summary = '%s\n%s' % (summary, sub_summary)  

df_all['cf_type'] = cf_type
df_all = (df_all.reset_index()
            .sort_values(by=['book','deal_num','reason'])
            #.set_index(['book','deal_num'])
            )
file_name = '%s%s' % (home_path,'\dealsWithDifferences2.xlsx')
writer = pd.ExcelWriter(file_name, engine = 'xlsxwriter')
df_all.to_excel(file_name, sheet_name = 'Result')
   
text_file = open("summaryLastRun.txt", "w")
text_file.write(summary)
text_file.close()

print('End')



