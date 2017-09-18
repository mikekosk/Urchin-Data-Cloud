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

## 2. Customize installed packages

To change the packages that your instance comes pre-installed with, you will need to modify the dockerfile.

TO-DO.
