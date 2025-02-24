#!/usr/bin/python3

# alphabetize tags in files

### imports
import fileinput
import logging
import pathlib

## Logger setup
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
stream_handle = logging.StreamHandler()
logger.addHandler(stream_handle)

### define constants
SEPERATOR = ", "
TAGS="tags"
ACROS="acronym"
## Glossary files only because some other files have non ASCII characters that dont read/write well here
mypath = "./Glossary/"
myfiles = "*.md"

# get the file name.
testfilename = "Glossary/FromSentinel/AAF.md"

def openReadSortWrite(filename: str):
    logger = logging.getLogger(__name__)
    for line in fileinput.input(filename, inplace=True):
        if len(line) > 0:
            strings = line.strip().split(SEPERATOR)

            if len(strings) > 2 and strings[0].startswith(TAGS):
                #logger.debug("split strings: {}".format(' '.join(map(str, strings))))

                preSorted = strings[1:]
                #logger.debug("split strings: {}".format(' '.join(map(str, preSorted))))
                preSorted.sort(key = str.lower) # case insensitive sorting
                #logger.debug("split strings: {}".format(' '.join(map(str, preSorted))))
                sortedPlus = [strings[0]] + preSorted
                newsortedPlus = SEPERATOR.join(sortedPlus)
                #logger.debug("sorted and ready strings: {}".format(' '.join(map(str, newsortedPlus))))
                print(newsortedPlus, end = '\n')
            else:
                #logger.debug("writing original input line: {}".format(line))
                print(line, end = '')
        else:
            #logger.debug("writing original input line: {}".format(line))
            print(line, end = '')


path = pathlib.Path(mypath)
for each in path.rglob(myfiles):
    if each.is_file():
        logger.info("file: %s", str(each))
        openReadSortWrite(str(each))

