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

if [[ ! -d .git ]]; then
  echo -e "\e[91mERROR\e[39m: It's not a git repository"
  echo "Start with gitbashCI init"
  exit 0
fi
Waitingbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -z $2 ]; then
  echo ""
  echo -n "Commit Message: "
  read COMMIT_MESSAGE
else
  COMMIT_MESSAGE=$1
fi
if [ -z $3 ]; then
  BRANCH=$Waitingbranch
else
  BRANCH=$3
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
