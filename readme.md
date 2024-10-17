
***kubernetes cluster using terraform and ansible in github actions pipeline***
In this project we create a github pipeline to create a kubeadm cluster using terraform for provisioning and ansible for configuration

***key notes***

add some secrets first in ur github repo 

`AWS_ACCESS_KEY_ID` - generate in your iam section of aws console

`AWS_SECRET_ACCESS_KEY` - generate in your iam section console

`SSH_PRIVATE_KEY` - go into your ec2 section and generate a keypair and save the data from .pem file that you download in your local machine as your secret

insert your repo name in this part of the main.yml of the workflow and you are good to go
```

```
all of the things except these secrets are done dynamically so you just have to run the pipeline from the actions tab

