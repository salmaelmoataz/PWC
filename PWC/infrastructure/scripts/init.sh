PRT="pwc"
rm -rf .terraform
terraform init \
    -backend-config="bucket=${PRT}-terraform-state" \
    -backend-config="dynamodb_table=${PRT}-terraform-lock" \
    -backend-config="key=${PRT}/terraform.tfstate" && \
terraform workspace new ${PRT} || echo "---" && \
terraform workspace select ${PRT} && \
terraform validate && \
terraform fmt -recursive