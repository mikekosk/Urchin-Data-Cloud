# User Guide

The following user guide is for customizing and enhancing the scripts to suit your needs.  We cover the following: 

1. How to password protect your instance
2. How to customize the packages that are pre-installed by your instance

## 1. Password Protecting Your Instance

<img src="http://image.ibb.co/fefTZQ/Screen_Shot_2017_09_18_at_3_00_22_PM.png" alt="Jupyter" width="500">

Jupyter notebooks can be password protected by replacing a line of code in the ```deploy-notebook/tasks/main.yml``` script from:

```
--NotebookApp.token=''
```
To:
```
--NotebookApp.password='PASSWORD_GOES_HERE'
```

## 2. Change your Docker Stack

Docker has provided its users with a series of pre-configured 'Docker Stacks', which are pre-built configuration instructions that specify which packages will be installed.    

To change the packages that your environment will install, you can access the [list of available Docker Stacks here](https://github.com/jupyter/docker-stacks).  Replacing the Docker Stack within the file: ```config/roles/deploy_scipy_notebook/tasks/main.yml``` with the desired Docker Stack. 

```
jupyter/scipy-notebook 
``` 
to 
```
jupyter/whatever
```

## 3. Customize your package list

Customizing which files are installed each time you set up an instance requires the following

- a free account with Docker
- a github account to host your dockerfile

First log into your github and create yourself a new repository where you'll store all your DockerFiles. I made a folder where I'll store the dockerfile for this example, called ```mike-custom```.  We'll put the dockerfile in this folder. [I have an example here from my own account of what this looks like](https://github.com/mikekosk/DockerFiles)

Feel free to fork this, or start with your own.  I started with a dockerfile from the Docker Stack called [scipy-notebook](https://github.com/jupyter/docker-stacks/blob/master/scipy-notebook/Dockerfile).  If you open the dockerfile, you'll find a an immediately recognizable list of packages like ```pandas```, ```matplotlib```, and ```scipy```.  Lets say I wanted to add ```xgboost``` to my package list thats automatically downloaded.  I'd either just add ```'xgboost' \``` to the list, or if I wanted a more specific version, I'd look it up on [the python package index](https://pypi.python.org/pypi).  In which case, I'd specify ```'xgboost=0.6*' \``` The star after ```0.6``` connotes that you're okay with any version change off 0.6 like 0.61 or 0.6a2. 

After you push this to your GitHub account, take note of the directory.  You should know your repository name, any folder you created, and the name of the dockerfile in your folder.

Next, you'll go to Docker and create and account there if you don't have one. After you create your Docker account, go and click 'Create Repository' to get started.  Give your repository a name [not necessarily the same as your github repo] and write a description.  

<img src="http://image.ibb.co/jqKvy6/Screen_Shot_2017_10_22_at_12_05_39_PM.png" alt="docker" width=500>

Now connect to your repository to your GitHub account and click 'Create'. On the next page, navigate to the 'Build' tab, and here you will specify your GitHub repo's subpage.

<img src="https://image.ibb.co/hOfuam/Screen_Shot_2017_10_22_at_3_43_39_PM.png" alt="docker" width=500>

After you click build, you should receive a success message. At this point, you'll modify the notebook run code described in #2 to direct from Jupyter's stacks to your Docker account.

```
jupyter/scipy-notebook 
``` 
to 
```
urchinlabs/mike [Docker Repo / repo name]
```







