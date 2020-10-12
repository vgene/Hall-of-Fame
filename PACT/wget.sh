#/bin/bash

# PACT

wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2Fpepc%2Fpepc1992.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact1992.bib || rm -f pact1992.bib
wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2Fifip10-3%2Fifip10-3-1993.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact1993.bib || rm -f pact1993.bib
wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2FifipPACT%2FifipPACT1994.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact1994.bib || rm -f pact1994.bib
wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2FIEEEpact%2Fpact1995.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact1995.bib || rm -f pact1995.bib

for((i = 1996; i <= 2005; i++)) 
  do 
    #curl https://dblp.dagstuhl.de/search/publ/api?q=toc%3Adb%2Fconf%2Fmicro%2Fmicro$i.bht%3A&h=1000&format=bib0&rd=1a > micro$i.bib
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2FIEEEpact%2FIEEEpact$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact$i.bib || rm -f pact$i.bib
    #wget http://dblp.dagstuhl.de/db/hc/conf/pact/pact$i.html; 
  done

wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2FIEEEpact%2Fpact2006.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact2006.bib || rm -f pact2006.bib
wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2FIEEEpact%2FIEEEpact2007.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact2007.bib || rm -f pact2007.bib

for((i = 2008; i <= pact; i++)) 
  do 
    #curl https://dblp.dagstuhl.de/search/publ/api?q=toc%3Adb%2Fconf%2Fmicro%2Fmicro$i.bht%3A&h=1000&format=bib0&rd=1a > micro$i.bib
    wget https://dblp.dagstuhl.de/search/publ/api\?q\=toc%3Adb%2Fconf%2FIEEEpact%2Fpact$i.bht%3A\&h\=1000\&format\=bib0\&rd\=1a -O pact$i.bib || rm -f pact$i.bib
    #wget http://dblp.dagstuhl.de/db/hc/conf/pact/pact$i.html; 
  done

find . -size 0 -delete
