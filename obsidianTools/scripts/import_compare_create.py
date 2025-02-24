
import csv
import os.path

#filename='FORCEAcronyms.txt'
#filename='OldAcronymsList.csv'
filename='sentinel_fences_Acronyms.csv'
compare_filename='table-export-001.csv'
DEST_FOLDER='../FromSentinel'
OUT_EXT='.md'
LINE_SEP='---\n'
TAG='tags: acronym'
ACRONYM='acronym: '
DEF='definition: '
#DELIM=','
DELIM=';'
THERE_ARE_TAGS=1

TESTING=0



def writeFile(acro, defin, tags):
    newAcro = "".join(c for c in acro if c != '/' and c.isprintable())
    outPath = os.path.join(DEST_FOLDER, newAcro + OUT_EXT)
    fCntr = 1
    while os.path.exists(outPath):
        outPath = os.path.join(DEST_FOLDER, newAcro + str(fCntr) + OUT_EXT)
        fCntr += 1

    fileOut = open(outPath, 'w')
    fileOut.write(LINE_SEP)
    fileOut.write(TAG+', '+tags+"\n")
    fileOut.write(ACRONYM+acro+"\n")
    fileOut.write(DEF+defin+"\n")
    fileOut.write(LINE_SEP)
    fileOut.write("\n")
    fileOut.write(defin+"\n")
    fileOut.write("\n")
    fileOut.close()




#with open(filename) as csv_file:
    #csv_reader = csv.reader(csv_file, delimiter=',')
    #line_count = 0
    #for row in csv_reader:
        #if line_count == 0:
            #print(f'Column names are {", ".join(row)}')
            #line_count += 1
        #else:
            #print(f'\t{row[0]} works in the {row[1]} department, and was born in {row[2]}.')
            #line_count += 1
    #print(f'Processed {line_count} lines.')



### FORCE acronym file is all space delimited. read first column as acronym, the other columns as the definition
#file1 = open(filename, 'w')
#file1.writelines(L)
#file1.close()

# Using readlines()
with open(filename, 'r') as fileIn:
    Lines = list(csv.reader(fileIn, delimiter=';'))
fileIn.close()
linesLength = len(Lines)

with open(compare_filename, 'r') as compareFile:
    compareData = list(csv.reader(compareFile, delimiter=';'))
compareFile.close()
compareLength = len(compareData)

if TESTING:
    print("num lines: ", linesLength, " num compare: ", compareLength)

count = 0
newList = []
# Strips the newline character
for line in Lines:
    count += 1
    acronym = line[0]
    del line[0]
    if THERE_ARE_TAGS:
        tags=line[1]
        defin=line[0]
    else:
        tags=' '
        defin=' '.join(line)
    defin = defin.strip()
    tags = tags.strip()

    i = 0
    while i < compareLength:
        testline = compareData[i]
        if acronym == testline[0] and defin == testline[1]:
            break
        i+=1
    if i >= compareLength:
        if TESTING:
            print(acronym, " not found")
        newList.append([acronym, defin, tags])

    if TESTING:
       print("count: ", count, "line: ", line, "acro: ", acronym, "\ndef: ", defin, "\ntags: ", tags)
       newAcro = "".join(c for c in acronym if c != '/')
       print("old acro: " + acronym + " new acro: " + newAcro)
       if count >= 1:
           exit(0)

for item in newList:
    writeFile(item[0], item[1], item[2])


