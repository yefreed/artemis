# -*- coding: utf-8 -*-
"""
Created on Tue Nov 29 21:08:16 2016

@author: YEFRDITT
"""

import pandas as pd
import numpy as np
import scipy as sp

df_art = pd.read_csv("H:\My Documents\\2. Projects\ARP Redesign\Cash Reconciliation\Gas OTC Purchase - Broker Fee\deals_artemis.csv", index_col='deal_num')[['book','amount']]
df_art.columns = ['book_artemis','amount']
df_arp = pd.read_csv("H:\My Documents\\2. Projects\ARP Redesign\Cash Reconciliation\Gas OTC Purchase - Broker Fee\deals_arp.csv", index_col = 'deal_id')[['book','nv_cc']]
df_arp.columns = ['book_arp','amount']

print('df_art imported length %s rows' % (len(df_art)))
print('df_arp imported length %s rows' % (len(df_arp)))


df_arp['nv_cc_neg'] = - df_arp['nv_cc']

df_common = df_art.merge(df_arp, how='inner', left_index = True, right_index = True)
print('df_common merged as a result of df_art and df_arp with a total of %s rows' % (len(df_common)))
df_common['diff'] = round(df_common['amount'],2) - round(df_common['nv_cc'],2)
df_diff = df_common[df_common['diff'] != 0]
print('There are %s deals with differences with an impact of' % (len(df_diff)),df_diff['diff'].sum())

df_deals_art_only = df_art[~df_art.index.isin(df_common.index)]
df_deals_art_only_non_zero = df_deals_art_only[df_deals_art_only['amount'] != 0]
(print('there are %s deals in artemis, not on ARP, of these %s are non zero for a total amount of %s' % 
       (len(df_deals_art_only)
       ,len(df_deals_art_only_non_zero)
       ,df_deals_art_only_non_zero['amount'].sum()
       ))
)

df_deals_arp_only = df_arp[~df_arp.index.isin(df_common.index)]
(print('there are %s deals on ARP, but not in ARTEMIS giving an impact of %s' % 
       (len(df_deals_arp_only)
       ,df_deals_arp_only['nv_cc'].sum()
       )
       )
)