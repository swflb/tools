
import csv
import os.path

from pathlib import Path

# find all duplicate names
# print duplicates and definitions, tag and path to file


SOURCE_FOLDER='../../acronyms/'
SEARCH_FILE = "acronyms.txt"
DEST='./duplicates.txt'

TESTING = 0
SPACE = 5

def getMinMaxRange(counter, maxL):
    minL = counter
    maxLength = maxL if ((counter + SPACE) >= maxL -1) else (counter + SPACE)
    return range(minL, maxLength,1)


theFile = os.path.join(SOURCE_FOLDER, SEARCH_FILE)
# Using readlines()
with open(theFile, 'r') as fileIn:
    Lines = list(csv.reader(fileIn, delimiter=';'))
fileIn.close()
linesLength = len(Lines)
print("lines: ", linesLength)



count = 0
matches = []
for line in Lines:
    if TESTING and count > 50:
        break
    for i in getMinMaxRange(count, linesLength):
        if i == count:
            continue
        compareLine = Lines[i]
        if line[0] == compareLine[0]:
            matches.append(line)
            matches.append(compareLine)
    count += 1

print("number of matches: ", len(matches))

fileOut = open(DEST,'w')
for line in matches:
    fileOut.write(';'.join(str(i) for i in line) + "\n")
fileOut.close()

