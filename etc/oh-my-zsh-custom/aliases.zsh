# Git Aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add .'
alias ddd="gst | grep deleted | awk '{print \$3}' | xargs -I{} git rm {}"
alias gdn="git diff --name-only"

function gcb {
  branch=$1
  count=`gb | grep $1  | wc -l`
  if [[ $count -ge 2 ]]; then
    echo "too many branches with $branch in the name:"
    gb | grep $1
    return
  fi

  if [[ $count -eq 1 ]]; then
    git co `gb | grep $1`
  else
    echo "no branches with $branch in the name"
  fi
}