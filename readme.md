
##***kubernetes cluster using terraform and ansible in github actions pipeline***

In this project we create a github pipeline to create a kubeadm cluster using terraform for provisioning and ansible for configuration
---
##***key notes***

add some secrets first in ur github repo 

`AWS_ACCESS_KEY_ID` - generate in your iam section of aws console

`AWS_SECRET_ACCESS_KEY` - generate in your iam section console

`SSH_PRIVATE_KEY` - go into your ec2 section and generate a keypair and save the data from .pem file that you download in your local machine as your secret

all of the things except these secrets are done dynamically so you just have to run the pipeline from the actions tab
---
if you have changed the name of the repo insert your repo name in this part of the main.yml of the workflow and you are good to go
```
- name: Create J2 template file
        run: |
          mkdir -p /home/runner/work/kubeclstr-using-terraformansible/kubeclstr-using-terraformansible/templates # change the name two times here 
          echo "
          
          " > /home/runner/work/kubeclstr-using-terraformansible/kubeclstr-using-terraformansible/masterip.yaml.j2 # change the name two times here 
```
first one is your runners name  and the second one is where your repo is saved with all the files 



