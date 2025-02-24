#!/usr/bin/python3

# ingest list of acronyms
#
# 1) assume this is semicolon delimited list
# 2) check how many columns.
# 2.1) column 1 is acronym
# 2.2) column 2 is definition
# 2.3) column 3 are tags
# 3) check if acronym already exists, if not insert into temporary folder inside the glossary


############################
### imports
import fileinput
import logging
import pathlib
import os
from datetime import datetime
from pymultimap.multimap import MultiMap
# requires "pip install pymultimap"

############################
## Logger setup
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
stream_handle = logging.StreamHandler()
logger.addHandler(stream_handle)

############################
### define constants
SEPERATOR = ","
TAGS="tags"
ACROS="acronym"
DEFINITION="definition"
LINE="---"


############################ input/output files setup
# @TODO read input file from user
newCsvFile = "newbs_20250211.csv"

# output to new folder inside the glossary
# @TODO read output folder from user or add date to path or add inputfile name as folder name
outPath = "./Glossary/temp" + datetime.today().strftime('%Y%m%d')
if not os.path.exists(outPath):
    os.mkdir(outPath)
    logger.info(str("Created output path: " + outPath))



############################ functions
def readMdFile(loopFilename, theMap):
    ## resulting map will look like:
    ### [acronym, [defintion, tags, filename]]
    isFirstLine = True
    loopDef = ""
    loopTags = ""
    loopAcro = ""
    fin = fileinput.input(loopFilename, inplace=False, openhook=fileinput.hook_encoded("utf-8"))
    for line in fin:
        if not isFirstLine and LINE in line:
            if loopAcro != "":
                theMap[loopAcro] = [loopDef, loopTags, str(loopFilename)]
            fin.close()
            return
        if not isFirstLine:
            strings = line.strip().split(":")
            if strings[0] == DEFINITION:
                loopDef = strings[1].strip()
            if strings[0] == TAGS:
                loopTags = strings[1].strip()
            if strings[0] == ACROS:
                loopAcro = strings[1].strip()
        if isFirstLine:
            if LINE not in line:
                fin.close()
                return
            else:
                isFirstLine = False
    fin.close()
############################


## Generate list of acronyms against which to compare
### read all files and look for acronym in header
myMap = MultiMap()
path = pathlib.Path("./")
counter=1
for each in path.rglob("*.md"):
    if each.is_file():
        #logger.info("file: %s", str(each))
        readMdFile(each, myMap)
        counter = counter + 1
print("md file count: " + str(counter) + " map size: " + str(len(myMap)))

############################
# read input file and compare against multimap of acronyms
acro = []
wcntr = 0
cntr = 0
isFirstLine = True
# read input file into array
for line in fileinput.input(newCsvFile, inplace=False):
    if isFirstLine:
        isFirstLine = False
    elif len(line) > 0:
        strings = line.strip().split(SEPERATOR)
        first = strings[0].strip()
        two = ""
        three = ""
        if len(strings) > 1:
            two = strings[1].strip()
        if len(strings) > 2:
            three = strings[2].strip()

        #print("testing: " + first)
        testA = []
        try:
            testA = myMap[first]
        # first test, if acronym does not already exist at all
        except:
            # write file
            contents = LINE + "\n"
            contents = contents +(TAGS + ": acronym, " + three + "\n")
            contents = contents +(ACROS + ": " + first + "\n")
            contents = contents +(DEFINITION + ": " + two + "\n")
            contents = contents +(LINE + "\n")
            contents = contents +("\n" + two + "\n")

            name = outPath + "/" + first

            try:
                with open(str(name + ".md"), "x") as f:
                    wcntr = wcntr +1
                    f.write(contents)
            except FileExistsError:
                print("Already exists: " + name)
                name = name + str(cntr)
                with open(str(name + ".md"), "x") as f:
                    wcntr = wcntr +1
                    f.write(contents)

        #acro.append([first, two, three])
        cntr = cntr + 1

print("number of new acronyms read: " + str(cntr) + " num written: " + str(wcntr))
# print(acro)
logger.info("done")


# compare my acronyms againts new list
# loop over new list and find in old list, if not in old list then generate file and write to outpath
## how to compare?
### first does new acronym exist "ACF" is not in old list, then write new file
### second it exists so compare definitions, if definitions not the same then write new file
### third definitions the same so combine tags if any new tags into old file


