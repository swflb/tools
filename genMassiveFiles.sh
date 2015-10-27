#!/bin/bash
# seth humphries created to test disk performance

################### variables global for this script ###################
MAXFILESIZE=5000 #number of blocks to write
MAXNUMFILES=10000 #maximum number of times through the loop
NUMINIMAGEFILES=5 # number of input image files from which to choose
BLOCKSIZE=1000000 #in units of bytes
BASEPATH="/iozone/test_files"
IMAGEPATH=$BASEPATH"/images"
ACTUALPATH=""


################### setup functions ###################
# generate the file path and verify it exists
getPath()
{
  ACTUALPATH=$BASEPATH"/"$hostname"/"$1
  echo $ACTUALPATH

  #check if path, generate if not present
  if [[ ! -d $ACTUALPATH ]]; then
    mkdir -p $ACTUALPATH
  fi
}

# generate file of random size
#   write to disk location with folder using hostname appended
#
genRanFile()
{
  # $1 is index for filename collision avoidance
  filename=$ACTUALPATH"/randFileData_"$1".dat"
  # echo "rand filename $filename"
  randSize=$((RANDOM % MAXFILESIZE + 1))
  # echo "random size $randSize"
  dd if=/dev/urandom of=$filename bs=$BLOCKSIZE count=$randSize
}

#read image file from shared disk location
  #alter file name
  #append hostname to folder
  #write image file back to disk
  #
readWriteImageFile()
{
  # $1 is index for filename collision avoidance
  whichIn=$((RANDOM % NUMINIMAGEFILES + 1 ))
  inFilename=$IMAGEPATH"/image"$whichIn".jpg"
  newFilename=$ACTUALPATH"/imageFileData"$1".dat"
  # echo "infilename $inFilename  outfilename $newFilename"
  dd if=$inFilename of=$newFilename
}


###################  Do actual stuff ###################
getPath "somepath" # inside parentheses could be different for each terminal
  # in which this script is run. then you could have multiple terminals on each
  # server running one of these and tell apart the written data.

echo "file path $ACTUALPATH"
for (( idx=0; idx<$MAXNUMFILES; idx++ )); do
  # echo "index $idx"
  genRanFile $idx
  readWriteImageFile $idx
done

