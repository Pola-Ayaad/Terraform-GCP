# Terraform-GCP
Deploy a Simple Python Project with GCP using Terraform


# Terraform-GCP
Deploy a Simple Python Project with GCP using Terraform

Creating Docker Image and pushing the image to Google artifacte registery :


1- Create a Folder for the project mkdir gcp-terraform

2- Clone the git repository to your folder git clone https://github.com/tradebyte/DevOps-Challenge

3- Create a Dockerfile for the project 

4- Create a bash file .sh to force run redis inside the container

5- Build your image docker image build . -t (image-name)

6- Make sure the image is up and running docker run -d -it (image-ID) bash

7- Check running container docker ps

8- Configure Docker on gcp gcloud auth configure-docker \
    us-east1-docker.pkg.dev 
    
9- Tag your image to push to google artifacte registery docker tag SOURCE-IMAGE LOCATION-docker.pkg.dev/PROJECT-ID/REPOSITORY/IMAGE

10- Push your Image docker push LOCATION-docker.pkg.dev/PROJECT-ID/REPOSITORY/IMAGE


Creating Terraform Files for Network  : 
   Note :  ---(Use terraform fmt)-- command to correct your files formate 
           ---GCP already supports state locking so there is no need to create a DynamoDB like
              in AWS state
           ---Run terrform init to intiate terraform enviroment and in case any changes in the backend.tf file you need to run the command again 


1- Create provider file 

2- Create credentials.json file which has the your credintials 

3- create a backendend.tf which will have the tfstae file uploaded to gcs bucket

4- create a variables.tf file to declare your enviromental variables

5- create terraform.tfvars to declare values to your variables 

6- create VPC

7- Create 2 Subnets 

8- Create Cloud Router which enables Cloud router enables you to exchange routes between vpc and peers 

9- Create Nat-Gatway 

10- Create IAP.tf to allow IAP 


Creating Terraform Files for the VM and GKE cluster 

1- Create 2 service accounts one for the VM and the other for the GKE cluster and the purpose of 

the service accounts intended to represent a non-human user that needs to authenticate and be authorized to access data in Google APIs.

2- Create VM with a stable version of Ubuntu --- make sure the tag is correct to you can ssh 

3- Create GKE cluster 

4- Terraform apply 

5- SSH on the machine ---- gcloud compute ssh vm --zone=us-east1-b


6- configure vm with gke credintials

7- Create a deployment and service.yml files

8- Apply those file 

9- Check your web 


https://github.com/Pola-Ayaad/Terraform-GCP/issues/1#issue-1322610148
