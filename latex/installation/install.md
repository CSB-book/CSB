# Installing `LaTeX`

### Linux

Different flavors of LaTeX are available. One of the most popular is called `TexLive`. To install in Linux Ubuntu, open a terminal and run:

```
sudo apt-get install texlive
```

This command creates a very minimal installation of LaTeX. There are many optional packages available. To install them all, use:

```
sudo apt-get install texlive-full
```

To install just a few, read the documentation [here](https://help.ubuntu.com/community/LaTeX), choose the packages you want to install, and run commands like:

```
sudo apt-get install gedit-latex-plugin texlive-fonts-recommended latex-beamer texlive-pictures texlive-latex-extra texpower-examples imagemagick
```

For different Linux distributions, read [here](https://latex-project.org/ftp.html).

### OS X

By far the best option is to install `MacTeX`. There are two main options: a basic installation, and a full installation. 

The installation is detailed [here](http://www.tug.org/mactex/).

### Windows

`proTeXt` provides a simple installation for Windows users. Please follow the instructions [here](http://www.tug.org/protext/).

## I cannot run `pdflatex` from the terminal

Depending on how you installed the software, you might not be able to call `pdflatex`, `bibtex`, etc. from your command line. This is because the terminal doesn't know where the software is located. 

To make the terminal aware of the program, you need to edit the file `.bash_profile` that is located in your home directory (if the file doesn't exist already, you can create it). 

For example, in OS X you might have installed LaTeX in the directory `/usr/texbin`. You want to add this directory to the list of directories that are automatically searched when you type a command in the terminal. To do so, open your `.bash_profile` in a text editor, and add the following line to the file:

```
export PATH=$PATH:/usr/texbin
```

Save the file, and restart the terminal. Now you should be able to invoke the commands.

To list all the directories that are searched when looking for programs, type:

```
echo $PATH
```

in your terminal.