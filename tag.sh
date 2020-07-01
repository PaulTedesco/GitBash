clear
echo ""
echo -e "\e[2m.=========================================================.\e[22m"
echo "|                                                         |"
echo "|  COMMAND LINE GIT INTERFACE                             |"
echo "|  ---------------------------------------------------    |"
echo "|                                                         |"
echo "|  Version: 1.0                                           |"
echo "|                                                         |"
echo -e "\e[2m.=========================================================.\e[22m"
echo ""

  echo ""
  echo -n "New Tag: "
  read TAG_VALUE

  echo ""
  echo -n "Comment :"
  read COMMENT

  git tag -a $TAG_VALUE -m "${COMMENT}"

  git push origin $TAG_VALUE