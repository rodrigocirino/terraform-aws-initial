#!/bin/bash

#
# Call with 
# $ chmod 765 .install.sh
# $ ./.install.sh 1
#

VAR=$1
# param VAR or default value 0
echo ${VAR:-0}
${BRANCH=versao${VAR}}
echo "${BRANCH}"

rm -fv *.tf
rm -fv .gitignore 
touch .gitignore
echo 'aula*' >> .gitignore
echo '.install.sh' >> .gitignore
echo '.gitignore' >> .gitignore
cat .gitignore
git pull origin main
git checkout -b ${BRANCH}
mv aula-${VAR:-0}-completa/*  .
git add .
git commit -m "update ${BRANCH}"
git push --set-upstream origin ${BRANCH}
git checkout main
git branch -D ${BRANCH}
git merge origin/${BRANCH}
git push
git status --long -u
