
## ***kubernetes cluster 1.33v using terraform and ansible in github actions pipeline*** ##

In this project we create a github pipeline to create a kubeadm cluster with 1 master node and 2 worker node using terraform for provisioning and ansible for configuration

---
## ***key notes*** ##

add some secrets first in ur github repo 

`AWS_ACCESS_KEY_ID` - generate in your iam section of aws console

`AWS_SECRET_ACCESS_KEY` - generate in your iam section console

`SSH_PRIVATE_KEY` - go into your ec2 section and generate a keypair and save the data from .pem file that you download in your local machine as your secret

all of the things except these secrets are done dynamically so you just have to run the pipeline from the actions tab
because the workflow is set to run only on workflow_dispatch you have to manually start the workflow
also before hand set the region in which u want the cluster
---
if you have changed the name of the repo insert your repo name in this part of the main.yml of the workflow and you are good to go

``` yaml
- name: Create J2 template file
        run: |
          mkdir -p /home/runner/work/kubeclstr-using-terraformansible/kubeclstr-using-terraformansible/templates # change the name two times here 
          echo "
          
          " > /home/runner/work/kubeclstr-using-terraformansible/kubeclstr-using-terraformansible/masterip.yaml.j2 # change the name two times here 
```

Directory Structure Explained:

`/home/runner/work/`:
This is the base directory where all work directories for GitHub Actions jobs are created.

`<repository-name>/`:
The first instance of <repository-name> is a directory created under work specifically for your repository. This is where the action's workspace for the job resides.

Second `<repository-name>/`:
The second instance of <repository-name> is the actual clone of your repository that is checked out into this workspace directory. When the repository is cloned, it is placed in a folder named after the repository.



