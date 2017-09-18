# Installation Guide

Following this installation guide, you will be able to spin up a custom EC2 instance with just one command.  Instructions have only been tested on Ubuntu Linux, Mac OSX, and Windows.

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
````

## Step 2: Configure your EC2 instance

Now we have Terraform installed we are ready to define the configuration for our first EC2 machine. If you don't have an AWS account, or you don't know how to grab either your access keys or SSH keys, read here: [link] (google.com, "To be updated")

Move the unzipped folder somewhere that will be easy for you to navigate to from the command line.  Open the file called ```main.tf```.  Using your favorite text editor, add your AWS access keys and SSH key file name to it. **Warning: Never post your access keys on the internet**

```
provider "aws" {

  access_key = "your_access_key_goes_here"
  secret_key = "your_secret_key_goes_here"
  region     = "us-west-2"
  <b>tag</b>.
}
```

```
resource "aws_instance" "mynode" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.medium"
  tags {
    Name = "mynode"
  }
  security_groups = ["${aws_security_group.allow_all.name}"]
  key_name = "your_ssh_key_name_goes_here"
}



