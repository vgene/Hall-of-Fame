#/bin/bash

# PLDI
conf_name=pldi

for((i = 88; i <= 99; ++i)) 
  do 
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2F${conf_name}%2F${conf_name}$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O tmp.bib
    if [ -s tmp.bib ]
    then
        mv tmp.bib ${conf_name}19$i.bib
    fi
    #wget http://dblp.dagstuhl.de/db/hc/conf/pldi/pldi$i.html; 
  done

for((i = 1987; i <= $1; ++i)) 
  do 
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2F${conf_name}%2F${conf_name}$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O tmp.bib
    if [ -s tmp.bib ]
    then
        mv tmp.bib ${conf_name}$i.bib
    fi
    #wget http://dblp.dagstuhl.de/db/hc/conf/pldi/pldi$i.html; 
  done

find . -size 0 -delete


find . -size 0 -delete
