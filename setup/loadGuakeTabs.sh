#!/bin/bash
firstDev="/home/seth/dev/mdp"
secDev="/home/seth/dev/secondMDP"
BD="build"
sleep 6
guake --new-tab=1 -r "mbuild" --execute-command="cd ${firstDev}/${BD}"
guake --new-tab=2 -r "mdp" --execute-command="cd ${firstDev}"
guake --new-tab=3 -r "2build" --execute-command="cd ${secDev}/${BD}"
guake --new-tab=4 -r "2mdp" --execute-command="cd ${secDev}"
