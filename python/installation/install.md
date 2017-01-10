# Installing `jupyter notebook`

## All systems
If you are starting from scratch, the simplest option is to install [Anaconda](https://www.continuum.io/downloads), choosing the version of `Python 3.5` for your operating system. Once you downloaded Anaconda:

### Linux

Open a terminal, go to the place where you downloaded anaconda (by default `home/yourname/Downloads`) and type:

```
bash Anaconda3-4.2.0-Linux-x86_64.sh
```

(substitute the right filename in case you downloaded a different version). Just accept the default values for all the questions during the installation. Close the terminal and restart it. Then type

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

### Windows

Install Anaconda using the graphical installation you downloaded. Choose all the default values during the installation. 

Then launch the application `Anaconda prompt` you should have just installed and type

```
conda install jupyter 
```

to upgrade the software. To create a new notebook, simply launch the application `Jupyter Notebook` that should now be available.

## Experienced users

In case you already have installed `Python 3.xx`, and you want to integrate `jupyter` with your current installation, follow the instructions [here](http://jupyter.readthedocs.org/en/latest/install.html#experienced-python-user-new-to-jupyter).

