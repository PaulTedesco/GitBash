#!/bin/bash

clear
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
echo "|  Usage: ./gitbashCI.sh <commit-message>                 |"
echo "|  Example: ./gitbashCI.sh \"feat(POR-150):message\"        |"
echo "|                                                         |"
echo -e "\e[2m.=========================================================.\e[22m"
echo ""

if [[ ! -d .git ]]; then
  echo -e "\e[91mERROR\e[39m: It's not a git repository"
  echo "go to https://github.com/new or https://gitlab.com/projects/new and create new project"
  echo -n "What is the clone url like this https://gitlab.com/steodec/TEST.git or git@gitlab.com:steodec/TEST.git : "
  read REPO
  PATH_SCRIPT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
  git init
  git remote add origin $REPO
  if [[ ! -f README.md ]]; then
    $PATH_SCRIPT/initReadme.sh
    exit 1
  fi
fi
Waitingbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -z $1 ]; then
  echo -e "\e[91mERROR\e[39m: No commit message."
  echo ""
  echo -n "Commit Message: "
  read COMMIT_MESSAGE
else
  COMMIT_MESSAGE=$1
fi
if [ -z $2 ]; then
  BRANCH=$Waitingbranch
else
  BRANCH=$2
fi
if echo $Waitingbranch | grep -Eq '[w+\/w+]'; then
  IFS='/'
  read -ra Wbranch <<<"$Waitingbranch"
  branch="${Wbranch[1]}"
  type="${Wbranch[0]}"
else
  select item in "- Feature -" "- Fix -"; do
    case $REPLY in
    1)
      type="feat"
      break
      ;;
    2)
      type="fix"
      break
      ;;
    esac
  done
  branch=$Waitingbranch
fi
git add .
git commit -m "$type($branch): $COMMIT_MESSAGE"
git push origin $BRANCH

echo -e "\e[92mSUCCESS\e[39m: Commit push on branch $BRANCH with this message $COMMIT_MESSAGE"
echo ""