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

dfi = (pd.read_csv('%sdifs.csv' % (home_path))[['book','ORIG_INSTRUMENT_KEY']]
    .sort_values(['ORIG_INSTRUMENT_KEY'] )
    .set_index(['ORIG_INSTRUMENT_KEY'])
#    .groupby(level = 0 )
    )

df = dfi.head(10).groupby(level = 0)

for name, group in df:
    sql_art, sql_arp = art.get_art_sql(name, group, cf_type);
    print(sql_art)    
    print(sql_arp)    
#    df_art = art.retrieve_data_from_database(cnxnstr_art,sql_art)
#    df_arp = art.retrieve_data_from_database(cnxnstr_arp,sql_arp)
#    df_comp = art.compare_systems(df_arp,df_art)
#    
#    file_name = '%s%s' % (home_path,'\deals_with_differences.xlsx')
#    writer = pd.ExcelWriter(file_name, engine = 'xlsxwriter')
#    df_comp.to_excel(file_name, sheet_name = '%s - %s' % (name,cf_type))
   

#text_file = open("Output_artemis.sql", "w")
#text_file.write(sql_artemis)
#text_file.close()
#
#text_file = open("Output_arp.sql", "w")
#text_file.write(sql_arp)
#text_file.close()


