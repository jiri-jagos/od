import csv
import json

import xlrd

with open('hlavicka1420.json', encoding='utf8') as f:
    hd = json.load(f)

wb = xlrd.open_workbook('data/2014-2020/2018_10_01-M023a-Seznam-operaci-_-List-of-operations.xls')
sh = wb.sheet_by_name('Seznam operací')

fr = [j.value.strip() for j in sh.row(2)]
assert fr == hd['ocekavane'], list(filter(lambda x: x[0] != x[1], zip(fr, hd['ocekavane'])))

def intify(s):
    if isinstance(s, str) and len(s) == 0:
        s = None
    else:
        assert s == int(s)
        s = int(s)
        
    return s

# TODO: nechcem strptime?
def predatuj(s):
    if len(s) == 0:
        return None
    
    d, m, y = map(int, s.split('.'))
    return f'{y}-{m:02d}-{d:02d}'

with open('data/operace_2014_2020.csv', 'w', encoding='utf8') as fw:
    cw = csv.writer(fw)
    cw.writerow(hd['hlavicka'])
    for j in range(4, sh.nrows):
        row = [l.value for l in sh.row(j)]
        
        row[6] = intify(row[6]) # ICO
        row[8] = intify(row[8]) # PSC
        
        for cl in [9, 10, 11]:
            row[cl] = predatuj(row[cl])
        
        cw.writerow(row)
