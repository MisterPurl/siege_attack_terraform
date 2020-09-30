# siege_attack_terraform

Stresstest http or https on domain.tld/IP whith AWS t2.micro and siege tools (https://www.joedog.org/siege-home/)

## Configuration
### modify variables.tf file with your ID

```bash
variable "AWS_ACCESS_KEY_ID" {
    type = string
    default = "your"
}
variable "AWS_SECRET_ACCESS_KEY" {
    type = string
    default = "your"
}
```

### modify the target server

Modify the ligne whith the target :

```bash
sudo siege -c10 -r1000 http://THE_WEB_SITE
```

### Check and start the terraform

```bash
terraform init
terraform plan
terraform apply -auto-approve
```
