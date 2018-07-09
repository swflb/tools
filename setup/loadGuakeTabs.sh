#!/bin/bash
firstDev="/home/shumphries/dev/mdp"
secDev="/home/shumphries/dev/secondMDP"
firstBuild="/home/shumphries/build/mdpbuild"
secBuild="/home/shumphries/build/secondbuild"
sleep 2
guake --new-tab="${firstBuild}" --rename-current-tab="mbuild";
guake --new-tab="${firstDev}" --rename-current-tab="mdp";
guake --new-tab="${secBuild}" --rename-current-tab="2build";
guake --new-tab="${secDev}" --rename-current-tab="2mdp";
