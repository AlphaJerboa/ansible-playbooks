#!/usr/bin/env bash

usage(){
  cat << EOF
$0 <inventory object> <tags>

EOF
ansible-playbook main.yml  --list-tags 2>/dev/null

exit 1
}

[[ -z "$1" ]] && usage
TAGS="${2:-common}"
[[ ! "$TAGS" =~ common ]] && TAGS="$TAGS,common"

ansible-playbook -i inventory/ --vault-id .vault_pass -l $1 --tags $TAGS main.yml
