cat data/dotinfo.csv | psql -c 'truncate dotinfo.dotace; copy dotinfo.dotace from stdin csv header'
