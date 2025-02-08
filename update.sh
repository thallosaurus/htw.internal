#!/bin/bash
ansible-playbook --extra-vars @secrets.enc --vault-password-file secrets.pass -i inventory.ini router.yml
ansible-playbook --extra-vars @secrets.enc --vault-password-file secrets.pass -i inventory.ini nas.yml
ansible-playbook --extra-vars @secrets.enc --vault-password-file secrets.pass -i inventory.ini wifi.yml

source aws.sh

cd terraform
terraform init
terraform apply --auto-approve