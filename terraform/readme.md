# terraform
To use it you need to have terraform installed

in ubuntu 
```bash
$ apt install terraform
```
Enter the project you want to run 

To init the terraform project 
```bash
$ terraform init
```
To see what the terraform will change 
```bash
$ terraform plan
```
To apply the changes
```bash
$ terraform apply
```

For AWS infrastructure:

The values for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` should be saved as environment variables on your workspace.