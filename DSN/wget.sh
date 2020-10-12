#/bin/bash

conf_name=dsn

for((i = 2000; i <= $1; ++i)) 
  do 
    #curl https://dblp.dagstuhl.de/search/publ/api?q=toc%3Adb%2Fconf%2Fmicro%2Fmicro$i.bht%3A&h=1000&format=bib0&rd=1a > micro$i.bib
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2F${conf_name}%2F${conf_name}$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O tmp.bib
    if [ -s tmp.bib ]
    then
        mv tmp.bib ${conf_name}$i.bib
    fi
    #wget http://dblp.dagstuhl.de/db/hc/conf/${conf_name}/${conf_name}$i.html; 
  done

find . -size 0 -delete
