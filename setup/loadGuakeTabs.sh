#!/bin/bash
firstDev="/home/shumphries/dev/mdp"
secDev="/home/shumphries/dev/secondMDP"
firstBuild="/home/shumphries/build/mdpbuild"
secBuild="/home/shumphries/build/secondbuild"
sleep 6
guake --new-tab=1 -r "mbuild" --execute-command="cd ${firstBuild}"
guake --new-tab=2 -r "mdp" --execute-command="cd ${firstDev}"
guake --new-tab=3 -r "2build" --execute-command="cd ${secBuild}"
guake --new-tab=4 -r "2mdp" --execute-command="cd ${secDev}"
