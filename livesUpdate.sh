#!/bin/bash

baseDir=$1
if [[ -z ${baseDir} ]] #empty
then
  baseDir="~/dev"
fi

repos=(pgadmin3 pgagent postgis)

for eachRepo in ${repos[*]}
do
  cd "${baseDir}/${eachRepo}/"
  git remote update
  for remote in `git branch -r `
  do 
    git branch --track $remote
  done
  git pull --all
  git push --all origin
done

