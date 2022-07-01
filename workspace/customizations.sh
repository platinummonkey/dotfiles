export EDITOR="vim"
      
alias replaceNewlines="sed ':a;N;$!ba;s/\n/\\n/g'"
      
function cdd() {
  subdir="${1}"
  cd $DATADOG_ROOT/$subdir
}

function find_merge_for() {
  git log $1..prod --ancestry-path --merges --reverse
}
