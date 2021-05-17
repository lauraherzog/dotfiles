# aliases for screen
alias scbase="screen -S base -t base -c ${HOME}/Templates/screen/base.sh"
alias scdoil="screen -S doil -t doil -c ${HOME}/Templates/screen/doil.sh"
alias scpack="screen -S packaging -t packaging -c ${HOME}/Templates/screen/packaging.sh"
alias sckd="screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill"

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    echo "[${BRANCH}]"
  else
    echo ""
  fi
}

export PS1="\[\e[32m\]\w\[\e[m\] \`parse_git_branch\`\n\A \[\e[34m\]\u\[\e[m\] \\$ "
