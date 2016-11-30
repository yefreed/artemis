# -*- coding: utf-8 -*-
"""
Created on Tue Nov 29 21:08:16 2016

@author: YEFRDITT
"""

import pandas as pd
import numpy as np
import scipy as sp

def compare_systems(home_path,ins_type,cf_type):
    df_art = (pd.read_csv('%s%s - %s%s' % (home_path,ins_type,cf_type,'\deals_artemis.csv'))
        [['deal_num','book','amount']]
        .sort_values(by='deal_num')
        .set_index('deal_num')
        )
    
    df_arp = (pd.read_csv('%s%s - %s%s' % (home_path,ins_type,cf_type,'\deals_arp.csv'))
        [['deal_id','book','nv_cc']]
        .sort_values(by='deal_id')
        )
    df_arp.columns = ['deal_num','book','nv_cc']
    df_arp.set_index('deal_num', inplace = True)
    print('df_art imported length %s rows' % (len(df_art)))
    print('df_arp imported length %s rows' % (len(df_arp)))
    
    #df_arp['nv_cc_neg'] = - df_arp['nv_cc']
    
    df_common = df_art.merge(df_arp, how='inner', left_index = True, right_index = True)[['book_x','amount','nv_cc']]
    df_common.columns = ['book','amount','nv_cc']
    print('df_common merged as a result of df_art and df_arp with a total of %s rows' % (len(df_common)))
    df_common['diff'] = round(df_common['amount'],2) - round(df_common['nv_cc'],2)
    df_diff = (df_common[round(df_common['diff'],0) != 0]
               .reset_index()
               .sort_values(by=['book','deal_num'])
               .set_index(['book','deal_num']))
    df_diff['reason'] = 'Difference between ARTEMIS and ARP'

    print('There are %s deals with differences with an impact of' % (len(df_diff)),df_diff['diff'].sum())
    
    df_deals_art_only = df_art[~df_art.index.isin(df_common.index)]
    df_deals_art_only_non_zero = df_deals_art_only[df_deals_art_only['amount'] != 0]
    df_deals_art_only_non_zero['reason'] = 'Deal in ARTEMIS only'
    df_deals_art_only_non_zero['diff'] = df_deals_art_only_non_zero['amount']
    (print('there are %s deals in artemis, not on ARP, of these %s are non zero for a total amount of %s' % 
           (len(df_deals_art_only)
           ,len(df_deals_art_only_non_zero)
           ,df_deals_art_only_non_zero['amount'].sum()
           ))
    )
    
    df_deals_arp_only = df_arp[~df_arp.index.isin(df_common.index)]
    df_deals_arp_only = df_deals_arp_only[df_deals_arp_only['nv_cc'] != 0]
    df_deals_arp_only['reason'] = 'Deal in ARP only'
    df_deals_arp_only['diff'] = -df_deals_arp_only['nv_cc']
    (print('there are %s deals on ARP, but not in ARTEMIS giving an impact of %s' % 
           (len(df_deals_arp_only)
           ,df_deals_arp_only['nv_cc'].sum()
           )
           )
    )
    df_concat = (pd.concat([df_deals_art_only_non_zero,df_deals_arp_only,df_diff.reset_index().set_index('deal_num')])[['book','diff','reason']]
               .reset_index()
               .sort_values(by=['book','deal_num','reason'])
               .set_index(['book','deal_num'])
               )
    return df_concat
    
home_path = 'H:\My Documents\\2. Projects\ARP Redesign\Cash Reconciliation\\'
ins_type = 'Gas OTC Purchase'
cf_type = 'Broker Fee'

df_con = compare_systems(home_path, ins_type, cf_type)
file_name = '%s%s' % (home_path,'\deals_with_differences.xlsx')
writer = pd.ExcelWriter(file_name, engine = 'xlsxwriter')
df_con.to_excel(file_name, sheet_name = '%s - %s' % (ins_type,cf_type))
#print(df_con)

          