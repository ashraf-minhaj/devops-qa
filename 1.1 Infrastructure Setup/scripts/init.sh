#!/bin/sh
echo "arg: $1"

cd ../Terraform
ls -a

pwd
if [[ "$1" == "dev" || "$1" == "stage" || "$1" == "prod" ]]; 
    then
        echo "environement: $1"
        # terraform init -input=false -migrate-state -backend-config=backend.$1.conf -var-file=terraform.$1.tfvars -lock=false
        terraform init -input=false -backend-config=backend.$1.conf -var-file=terraform.$1.tfvars -lock=true
    else
        echo "Wrong Argument"
        echo "Pass 'dev', 'stage' or 'prod' only."
fi 