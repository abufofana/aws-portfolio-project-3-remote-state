\# AWS Terraform Remote State Project

## Overview

In this project I moved Terraform state from local storage to a remote S3 backend and added DynamoDB for state locking.

I did this because storing Terraform state locally is risky. If multiple people run Terraform at the same time, the state file can get corrupted. Using S3 and DynamoDB allows teams to work on the same infrastructure safely.



\-------------------------------------------------------------------------------------------



\## Infrastructure Created



This project provisions the following AWS resources:



\- S3 bucket for Terraform remote state storage

\- S3 bucket versioning to protect state history

\- DynamoDB table for Terraform state locking



\-------------------------------------------------------------------------------------------



\## Why Remote State Matters



By default, Terraform stores state locally on a machine. This can be dangerous in team environments because:



\- The state file can be lost if a machine is lost

\- Multiple engineers can overwrite the state file

\- There is no locking to prevent concurrent changes



Using S3 and DynamoDB solves these problems by storing the state remotely and locking the state during Terraform runs.



\-------------------------------------------------------------------------------------------



\## Terraform Backend Configuration



This project uses an S3 backend with DynamoDB locking. After creating the backend resources, the Terraform state was migrated from local storage to the S3 backend.



\-------------------------------------------------------------------------------------------



\## Terraform Workflow Used



terraform init  

terraform fmt  

terraform validate  

terraform plan  

terraform apply  



After backend migration:



terraform init (backend migration)  

terraform plan  



\-------------------------------------------------------------------------------------------



\## What I Learned



This project helped me understand how Terraform state works, why remote state is important, and how teams collaborate safely using Terraform with state locking.



\-------------------------------------------------------------------------------------------



\## Project Structure



