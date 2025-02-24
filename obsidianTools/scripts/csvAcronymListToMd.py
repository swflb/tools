###
# read txt file that is semicolon delimited.
# the text file must contain only 3 columns: acronym, definition and tags
# the file exists in this repo: https://bitbucket.sdl.usu.edu/users/shumphries/repos/acronyms/browse
#


import csv
import os.path

## constants
OUT_EXT='.md'
LINE_SEP='---\n'
TAG='tags: acronym'
ACRONYM='acronym: '
DEF='definition: '
DELIM=';' # must be a semicolon

## should not change
filename='../../acronyms/acronyms.txt'
DEST_FOLDER='../../' # this file should exist in the Glossary/toAdd/ folder, check the entire upper level folder

## variable to output extra information during testing
TESTING=0


# the process of this file should be as follows
# read the file
# compare the acronym and definition from each line to existing files.
# if the acronym and definition already exist, move to the next line
# if it does not exist, create a new file containing the info
#

def walkDirs(dirToWalk):
    newFiles = []
    for root, dirs, files in os.walk(dirToWalk):
        # print(dirs)
        for dirname in dirs:
            if not "." in dirname:
                someVar = walkDirs(dirname)
                if someVar:
                    newFiles.append(someVar)
        for file in files:
            if ".md" in file:
                newFiles.append(os.path.join(root,file))
    return newFiles

foundFiles = walkDirs(DEST_FOLDER)
foundFiles.sort()
print(foundFiles)
print("length: ",len(foundFiles))
exit(0)

def writeFile(destin, acro, defin, tags):
    outPath = os.path.join(destin, acro + OUT_EXT)
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


# Use readlines() to read entire file into dictionary
fileIn = open(filename, 'r')
Lines = fileIn.readlines()
fileIn.close()

count = 0
# act on each line of the file separately
for line in Lines:
    count += 1
    theWords = line.split(DELIM)
    acronym = theWords[0]
    defin=theWords[1]
    tags=theWords[2]

    # check all the folders in the destination folder recursively for acronyms.

    if TESTING:
        print("line: " + line + "acro: " + acronym + "\ndef: " + defin + "\n")
        if count >= 1:
            exit(0)

    writeFile(DEST_FOLDER, acronym, defin, tags)


