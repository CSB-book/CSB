# Installing `Python` and `jupyter notebook` via the `Anaconda` package manager


## All systems
Install the package management system [Anaconda](https://www.anaconda.com/download/) and chose the version of `Python 3.7` for your operating system. Once you downloaded Anaconda follow the instructions according to your operating system:

### Linux

Open a terminal, go to the place where you downloaded anaconda (by default `home/yourname/Downloads`) and type:

```
bash Anaconda3-2018.12-Linux-x86_64.sh
```

(substitute the correct filename). Just accept the default values for all the questions during the installation. Close the terminal and restart it. Then type

```
conda install jupyter 
```

To upgrade all the packages.

To launch `jupyter notebook`, just open a terminal, navigate to the directory where you want to launch the program, and type 

```
jupyter notebook
```

Which should launch jupyter in your default browser.

### OSX

Launch the `.pkg` file you downloaded and follow the instructions.

Once you are finished installing Anaconda, launch a new terminal and type

```
conda install jupyter 
```

to upgrade the software.

Anaconda automatically attempts to add the path of the new Python installation to your PATH. If that fails, you can add the path manually by adding:

```
export PATH=/home/$USER/anaconda/bin:$PATH
``` 
to your `.bash_profile` (see section 1.10 for more information.)


### Windows

Install Anaconda using the graphical installation you downloaded. Choose all the default values during the installation. 

If the installation was successful, you should find the application `Anaconda prompt` in your Start menu. Right-click on the application and select 'Run as administrator'. In the Anaconda terminal type

```
conda install jupyter 
```

to upgrade the software. To create a new notebook, simply launch the application `Jupyter Notebook` that should now be available in the folder 'Anaconda3' in the Start menu.


## Experienced users

Open a terminal and check which `Python` version you are currently running:

```
python --version
```

In case you already have installed `Python 3.xx`, and you want to integrate `jupyter` with your current installation, follow the instructions [here](http://jupyter.readthedocs.org/en/latest/install.html#experienced-python-user-new-to-jupyter).

