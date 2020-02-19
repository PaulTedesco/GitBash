clear

if [[ ! -d .git ]]; then
  echo -e "\e[91mERROR\e[39m: It's not a git repository"
  echo ""
  exit 1

fi
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

./gitbashCI.sh

#EOF
