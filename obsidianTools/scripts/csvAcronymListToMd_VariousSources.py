
import csv
import os.path

#filename='FORCEAcronyms.txt'
#filename='OldAcronymsList.csv'
filename='SDL_acronyms.csv'
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
fileIn = open(filename, 'r')
Lines = fileIn.readlines()
fileIn.close()

count = 0
# Strips the newline character
for line in Lines:
    count += 1
    theWords = line.split(DELIM)
    acronym = theWords[0]
    del theWords[0]
    if THERE_ARE_TAGS:
        tags=theWords[1]
        defin=theWords[0]
    else:
        tags=' '
        defin=' '.join(theWords)

    defin = defin.strip()
    tags = tags.strip()


    if TESTING:
        print("line: " + line + "acro: " + acronym + "\ndef: " + defin + "\n" + "tags: " + tags)
        newAcro = "".join(c for c in acronym if c != '/')
        print("old acro: " + acronym + " new acro: " + newAcro)
        if count >= 1:
            exit(0)

    writeFile(acronym, defin, tags)


