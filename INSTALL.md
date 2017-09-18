# Installation Guide

Following this installation guide, you will be able to spin up a custom EC2 instance with just one command.  Instructions have been tested on Ubuntu Linux and Mac OSX.  

Setup should take less than 10 minutes if you're familiar with these tools, but still less than 30 minutes if you're starting from scratch. 

**You will be installing:**
- Terraform - to spin up an EC2 instance programmatically 
- Ansible - to configure the instance and install our packages
- Docker - to build and run our containers

## Step 1: Install Terraform

Terraform is an extremely useful tool that lets us provision infrastructure programmatically. Terraform has a relatively low learning curve that allows beginners to quickly start benefitting from automated infrastructure provisioning. 

We'll be using Terraform to spin up our Amazon EC2 Instance

Find the appropriate package for your system and download it from [here](https://www.terraform.io/intro/getting-started/install.html).

You'll need to save the unzipped binary somewhere on your computer. Make a folder somewhere safe where you can store it. 

The final install step is to add the binary to your computer's path.  You'll have to edit the path link below and add it to your BASH file.  See [this page](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux) for instructions on setting the PATH on Linux and Mac. [This page](https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows) contains instructions for setting the PATH on Windows.

```
$ export PATH="/link/to/terraform:$PATH"
```

Reload your terminal or force it to read ~/.bashrc again:

```
$ source ~/.bashrc
```

Verify your installation by typing “terraform” in your terminal with no arguments. If your installation was successful, you should see something similar:
```
$ terraform 
Usage: terraform [--version] [--help] <command> [args]
[...]
```

## Step 2: Configure your EC2 instance

Now we have Terraform installed we are ready to define the configuration for our first EC2 machine. If you don't have an AWS account, or you don't know how to grab either your access keys or SSH keys, read here: [link] (google.com, "To be updated")

Move the unzipped folder somewhere that will be easy for you to navigate to from the command line.  Open the file called ```main.tf```.  Using your favorite text editor, add your AWS access keys and SSH key file name to it. You can also change the instance region here as well: ```region = "us-west-2"```.  Amazon has a directory of all the possible repos [here](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions).

**Warning: NEVER post your access keys on the internet, or any public repo. Somebody will find them, and rack up hundreds of billable hours to your instance**

```
provider "aws" {

  access_key = "YOUR_ACCESS_KEY_GOES_HERE"
  secret_key = "YOUR_SECRET_KEY_GOES_HERE"
  region     = "us-west-2"
}
```

Below you can also customize the size of your instance.  For a full list of possible servers, [see here](https://aws.amazon.com/ec2/instance-types/ "Instance sizes").  I recommend the T2/M4 series for an all-purpose notebook, and the C4 series for any high intensity work.  

```
resource "aws_instance" "mynode" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.medium"
  tags {
    Name = "mynode"
  }
  security_groups = ["${aws_security_group.allow_all.name}"]
  key_name = "YOUR_SSH_KEY_NAME_GOES_HERE"
}
```
Note: The key_name should be the "/link/to/your/key"! Do not include the ```.pem```.

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

To get the most of your experience read the additional documentation In the [user guide], where we cover the following customizations:

1. How to password protect your instance
2. How to customize the packages that are pre-installed by your instance  
