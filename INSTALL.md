# Installation Guide

Following this installation guide, you will be able to spin up a custom EC2 instance with just one command.  Instructions have been tested on Ubuntu Linux and Mac OSX.  

Setup should take less than 30 minutes if you're familiar with these tools, but less than an hour if you're starting from scratch.

**You will be installing:**
- Terraform - to spin up an EC2 instance programmatically 
- Ansible - to configure the instance and install our packages
- Docker - to build and run our containers

**requirements**
- Willingness to learn!

## Step 1: Install Terraform

Terraform is an extremely useful tool that lets us provision infrastructure programmatically. Terraform has a relatively low learning curve that allows beginners to quickly start benefitting from automated infrastructure provisioning. 

We'll be using Terraform to spin up our Amazon EC2 Instance

Find the appropriate package for your system and download it from [here](https://www.terraform.io/intro/getting-started/install.html).

You'll need to save the unzipped binary somewhere on your computer. Make a folder somewhere safe where you can store it. 

The final install step is to add the binary to your computer's PATH.  You'll have to edit the PATH link below and add it to your BASH file.  See [this page](https://github.com/mikekosk/Urchin-Data-Cloud/blob/master/BASH-PROFILE.md) for my detailed explantion of what PATH is and how to edit it on Linux and Mac. [This page](https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows) contains instructions for setting the PATH on Windows.

On MAC, you'll need to add the additional path to your .bash_profile as shown below. 

```
$ export PATH="/link/to/terraform_folder:$PATH"
```

Reload your terminal or force it to read ~/.bashrc again with ```$ source ~/.bashrc```

Verify your installation by typing “terraform” in your terminal with no arguments. If your installation was successful, you should see something similar:

```
$ terraform 
Usage: terraform [--version] [--help] <command> [args]
[...]
```

## Step 2: Configure your EC2 instance

Now we have Terraform installed we are ready to define the configuration for our first EC2 machine. If you don't have an AWS account, [create one first here](https://aws.amazon.com/).  Don't worry, you can do all this on the free tier of Amazon AWS.  

Next, move the unzipped folder somewhere that will be easy for you to navigate to from the command line.  Open the file called ```terraform.tfvars```.  Using your text editor, add your AWS access keys, [for which instructions can be found here](https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/).

**Warning: NEVER post your access keys on the internet, or any public repo. Somebody will find them, and rack up hundreds of billable hours to your instance. Source: Happened to me :(**

```
access_key = "ACCESS_KEY"
secret_key = "SECRET_KEY"
```
You can also change the instance region here as well: ```region = "us-west-2"```.  Amazon has a directory of all the possible regions [here](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions).

Below you can also customize the size of your instance.  For a full list of possible servers, [see here](https://aws.amazon.com/ec2/instance-types/ "Instance sizes").  I recommend the T2/M4 series for an all-purpose notebook, and the C4 series for any high intensity work.  The micro and medium instances are free and sufficient for this project.  

```
specs = {
  "type" = "t2.medium",
  "name" = "mynode",
  "key_name" = "Work" \\this is the file name, do not include the extension!
}
```

Lastly, you'll have to download your key file and store it in your .ssh folder.  [See here how to create and download your key file](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).  Save the file somewhere you can access it and move it to your home directory .ssh folder.  If you don't know where that is, follow the code along below to create a folder and copy it to the directory

```
cd
mkdir .ssh
cp /link/to/your/key.pem ~/.ssh/
```

## Step 3: Install Ansible

If you don't have Ansible, install it via [this guide](http://docs.ansible.com/ansible/latest/intro_installation.html#installation).  We recommend installing via pip or apt-get if you're on Mac on Linux. 

## Step 4: Test install

Navigate into your config directory from the terminal.  Run the following command to build and configure your install.
```
terraform apply
```
After a few minutes, you should get the IP address of your instance.  You should be able to navigate to the instance by going to the IP address in your browser.

<img src="https://image.ibb.co/dS5sB5/Screen_Shot_2017_09_18_at_1_23_06_PM.png" alt="Jupyter" width="600">

To shut down your instance, run the following code:
```
terraform destroy
```

## Step 5: Connecting via SFTP

Transfering data between your local machine and the instance is handled by an SFTP client like [FileZilla](https://filezilla-project.org/), which is the recommended free solution for most users.

You'll need to add the IP address and your key-file, and your instance has to be running to connect via SFTP.

<img src="https://image.ibb.co/fseNdk/Screen_Shot_2017_09_18_at_1_07_22_PM.png" alt="FileZilla" width="600">

Your Jupyter home directory is located here: ```/home/ubuntu/storage```


## Step 6: User Guide

To get the most of your experience read the additional documentation In the [user guide](https://github.com/mikekosk/datascience-cloud/blob/master/USER-GUIDE.md), where we cover the following customizations:

1. How to password protect your instance
2. How to customize the packages that are pre-installed by your instance  
