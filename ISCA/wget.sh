#/bin/bash

conf_name=isca

for((i = 73; i <= 99; ++i)) 
  do 
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2F${conf_name}%2F${conf_name}$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O tmp.bib
    if [ -s tmp.bib ]
    then
        mv tmp.bib ${conf_name}19$i.bib
    fi
    #wget http://dblp.dagstuhl.de/db/hc/conf/${conf_name}/${conf_name}$i.html; 
  done

for((i = 1973; i <= $1; ++i)) 
  do 
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2F${conf_name}%2F${conf_name}$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O tmp.bib
    if [ -s tmp.bib ]
    then
        mv tmp.bib ${conf_name}$i.bib
    fi
    #wget http://dblp.dagstuhl.de/db/hc/conf/${conf_name}/${conf_name}$i.html; 
  done

find . -size 0 -delete
