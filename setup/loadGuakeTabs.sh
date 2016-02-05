#!/bin/bash
firstDev="/home/seth/dev/mdp"
secDev="/home/seth/secondMDP"
BD="build"
mkdir -p ${firstDev}/${BD}
mkdir -p ${secDev}/${BD}
#sleep 5
guake --new-tab=1 -r "mbuild" --execute-command="cd ${firstDev}/${BD}"
#sleep 2
guake --new-tab=2 -r "mdp" --execute-command="cd ${firstDev}"
#sleep 2
guake --new-tab=3 -r "2build" --execute-command="cd ${secDev}/${BD}"
#sleep 2
guake --new-tab=4 -r "2mdp" --execute-command="cd ${secDev}"
