#!/bin/sh -ex
PLAYBOOK=${1:-site.yml}
INVENTORY=${2:-dev}
PASSWORD=${3:-password}
shift || true
shift || true
shift || true
other_args="$@"

## TODO: For offline scen<rios, roles should be added to SCM
ansible-galaxy install -r requirements.yml
sshpass -p ${PASSWORD} ansible-playbook -i inventories/${INVENTORY} ${PLAYBOOK} --extra-vars "ansible_become_pass=${PASSWORD}" -k ${other_args}
