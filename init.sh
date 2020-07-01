clear
echo ""
echo -e "\e[2m.=========================================================.\e[22m"
echo "|                                                         |"
echo "|  COMMAND LINE GIT INTERFACE Readme                      |"
echo "|                                                         |"
echo "|  ---------------------------------------------------    |"
echo "|                                                         |"
echo "|  Version: 1.0                                           |"
echo "|                                                         |"
echo -e "\e[2m.=========================================================.\e[22m"
echo ""
echo "go to https://github.com/new or https://gitlab.com/projects/new and create new project"
echo -n "What is the clone url like this https://gitlab.com/steodec/TEST.git or git@gitlab.com:steodec/TEST.git : "
read REPO
PATH_SCRIPT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
git init
git remote add origin $REPO

echo -n "Project Name: "
read PROJECT_NAME

echo -n "Author: "
read AUTHOR

echo -n "Email: "
read EMAIL

echo "# $PROJECT_NAME" >>README.md
echo ">Author: $AUTHOR" >>README.md
echo "" >>README.md
echo ">Email: $EMAIL" >>README.md

echo -e "\e[92mSUCCESS\e[39m: New Readme.md created"
echo ""
exit 0
