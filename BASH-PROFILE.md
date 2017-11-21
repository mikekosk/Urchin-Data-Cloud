# Editing your Bash Profile

Your Bash Profile is where your OS stores additional terminal-executable binaries that are outside the ones your OS comes with, such as ```cat, cd, mkdir```.  We'll be adding a new ```PATH``` that tells our OS to look for executable binaries in a new location.  

We'll need to add Terraform to this list so that we can call it from our command line regardless of where we are in our file structure. While many applications will automatically do this for you when you install them, Terraform does not come installed. It is provided as an *executable binary* for you to wire up to your system as you see fit. 

## Mac OS X instructions

Your Mac's ```.bash_profile``` is gernally located in your Mac's home directory. To go to your home directory, open up Terminal and type in ```cd```.  After this, type in ```ls -a``` to get a list of all the files in that directory, including the hidden ones (thats the purpose of the ```-a``` flag).

We'll be using the old-school text editor ```vim``` to create a new ```PATH``` to our Terraform folder.  In your home directory, type ```vim .bash_profile``` to open it up.  Vim can be horribly annoying at first, but the most important distinction to note is between **insert** and **command** mode.  It starts up in command mode, which means you can't edit the file.  To get into insert-mode, type ```i```.  You'll then include a line telling your OS to look for binaries in the specified folder.  

```export PATH=$PATH:/link/to/your/terraform/folder:$PATH```

After you're done, you switch back to command mode by clicking ```ESC```.  To write-to-file and quit, type ```:wq!``` Reload your terminal or force it to read ~/.bashrc again:

```
$ source ~/.bashrc
```

Verify your installation by typing “terraform” in your terminal with no arguments. If your installation was successful, you should see something similar:
```
$ terraform 
Usage: terraform [--version] [--help] <command> [args]
[...]
