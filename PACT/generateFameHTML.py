import bibtexparser
import re
import glob, os

os.chdir("./")
fameDB = {}
fameHTML = "fame.html"
html = open(fameHTML, "w")
#print html file header

# get conference name from path
CONF = os.getcwd().split("/")[-1]
conf = CONF.lower()

# print html file header
header = "<!DOCTYPE html><html>\n"
header += "<head>\n"
header += "<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\"/>\n"
header += "<title>" + CONF + " Hall of Fame</title>\n"
header += "</head>\n"
html.write(header)

# get conf year information
filelist = glob.glob(conf+"*.bib")
print(filelist)
sorted_filelist = sorted(filelist)
years = len(filelist)
#print years, sorted_filelist

# start body of html
body = "<body>\n"
table = "<table>\n"

# add the first three leading rows
row1 = "<tr>\n"
row1 += "<th rowspan=\"3\">Paper Count</th>"
row1 += "<th rowspan=\"3\">Author</th>"
row1 += "<th colspan=\"" + str(years) + "\">" + CONF + " Year</th>"
row1 += "\n</tr>\n"

row2 = "<tr>\n"
for i in range(years):
  year = sorted_filelist[i].replace(conf,"")
  row2 += "<th>"+year[2]+"</th>"
row2 += "\n</tr>\n"

row3 = "<tr>\n"
for i in range(years):
  year = sorted_filelist[i].replace(conf,"")
  row3 += "<th>"+year[3]+"</th>"
row3 += "\n</tr>\n"

table += row1
table += row2
table += row3

for i in range(years): 
  index = str(i)
  file = sorted_filelist[i]
  year = file.split(".")[0].replace("asplos","")
  with open(file) as bibtex_file:
      bib_database = bibtexparser.load(bibtex_file)
      for paper in bib_database.entries:
        if u'author' in paper:
          authors = paper[u'author'].split("and\n")
          #print authors
          for author in authors:
            # remove formatting for special unicode characters
            author = re.sub("{|}|'", "", author)
            author = author.replace("\\", "") 
            # remove leading and trailing spaces
            author = author.strip()
            #print author
            # update to fame databse
            if author not in fameDB:
              fameDB[author] = {}
              fameDB[author]['total'] = 0
            if index not in fameDB[author]:
              fameDB[author][index] = 1
              fameDB[author]['total'] = fameDB[author]['total'] + 1
            else:
              fameDB[author][index] = fameDB[author][index] + 1
              fameDB[author]['total'] = fameDB[author]['total'] + 1

#for key in fameDB.keys():
#  entry = fameDB[key]
#  fameDB[key] = sorted(entry.items(), key=lambda x: x[0], reverse = False)

sortedByTotalPubs = sorted(fameDB.items(), key=lambda x: x[1]['total'], reverse = True) 
authorSortedByTotalPubs = [ele[0] for ele in sortedByTotalPubs]
#print authorSortedByTotalPubs 

maintable = ""

for author in authorSortedByTotalPubs:
  #print author, fameDB[author]
  if fameDB[author]['total'] < 5:
      break
  row = "<tr>"
  row += "<td>" + str(fameDB[author]['total']) + "</td>"
  if author == "David I. August":
    row += '<td><a class="anchor" id="liberty"></a>'+ author + "</td>"
  else:
    row += "<td>" + author + "</td>"
  for i in range(years):
    index = str(i)
    if index not in fameDB[author]:
      row += "<td>0</td>"
    else:
      row += "<td>" + str(fameDB[author][index]) + "</td>"
  row += "</tr>\n"
  maintable += row


table += maintable

table += "</table>\n"
body += table
body += "</body>\n"
body += "</html>"
html.write(body)

