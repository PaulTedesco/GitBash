#!/bin/bash

clear

if [[ ! -d .git ]]
then
	echo -e "\e[91mERROR\e[39m: It's not a git repository"
	echo ""
	exit 1

fi
echo ""
echo -e "\e[2m.=========================================================.\e[22m"
echo "|                                                         |"
echo "|  COMMAND LINE GIT INTERFACE                             |"
echo "|  ---------------------------------------------------    |"
echo "|                                                         |"
echo "|  Version: 1.0                                           |"
echo "|                                                         |"
echo "|                                                         |"
echo "|                                                         |"
echo "|  Usage: ./gitall.sh <commit-message>                    |"
echo "|  Example: ./gitall.sh \"feat(POR-150):message\"           |"
echo "|                                                         |"
echo -e "\e[2m.=========================================================.\e[22m"
echo ""


if [ -z $1 ]
then
	echo -e "\e[91mERROR\e[39m: No commit message."
	echo ""
	echo -n "Commit Message: "
	read COMMIT_MESSAGE
else
	COMMIT_MESSAGE=$1
fi
if [ -z $2 ]
then
	echo -e "\e[91mERROR\e[39m: No branch."
	echo ""
	echo -n "Branch: "
	read BRANCH
else
	BRANCH=$2
fi
git add .
git commit -m "$COMMIT_MESSAGE"
git push origin $BRANCH

echo -e "\e[92mSUCCESS\e[39m: Commit push on branch $BRANCH with this message $COMMIT_MESSAGE"
echo ""

#EOF
