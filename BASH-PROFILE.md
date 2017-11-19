# Editing your Bash Profile

Your Bash Profile is where your OS stores additional terminal-executable binaries that are outside the ones your OS comes with, such as ```cat, cd, mkdir```.  

We'll need to add Terraform to this file, so that we can call it from our command line. While many applications will automatically do this for you when you install them, Terraform does not come installed. It is provided as a binary for you to wire up to your system as you see fit. 

## Mac OS X instructions

Your Mac's ```.bash_profile``` is gernally located in your Mac's home directory. To go to your home directory, open up Terminal and type in ```cd```.  After this, type in ```ls -a``` to get a list of all the files in that directory, including the hidden ones (thats the purpose of the ```-a``` flag).

We'll 
