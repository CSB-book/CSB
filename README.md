# CSB

Git repository accompanying the book:

> [*Computing Skills for Biologists --- A Toolbox*](https://press.princeton.edu/titles/13268.html) by Stefano Allesina & Madlen Wilmes, Princeton University Press, 2019.

See also the website [computingskillsforbiologists.com](http://computingskillsforbiologists.com/) for news, errata, and extra material.

## How to download the material:
### Install `Git`

To download all the material, you first need to install `Git`. The instructions are [here](https://github.com/CSB-book/CSB/blob/master/git/installation/install.md).

Once you have installed `Git`, open a Terminal:

#### Linux Ubuntu

Press `Ctrl` + `Alt` + `T` or open the dashboard and type `terminal`.

#### Mac OSX 

The application `Terminal` is located in *Utilities* within *Applications*.

#### Windows

When you install `Git`, the program `GitBash` is installed automatically. Open `GitBash`.

### Clone the repository

The terminal should open in your home folder. Type

`git clone https://github.com/CSB-book/CSB.git`

The command downloads all the material on your computer. To make sure you everything went well, type:

`ls CSB/`

If you see a list of directories, everything is good. You can close the terminal.

## Organization of the material

For each of the chapters, we provide a directory containing:

- `installation`: instructions on how to install the software.
- `data`: the data used for example and exercises; for each data set, see the `about` file for a reference to the original article and a link to the Dryad record.
- `sandbox`: where you should be working.
- `solutions`: contains the solution to the exercises at the end of each chapter. A full solution is provided in the appropriate language (e.g., `Python`, `R`, `SQL`), as well as a `pdf` file. A markdown file contains the description of the solution in plain English: if you are stuck on an exercise, check this file out first, and get inspired to solve the problem.

## Acknowledgements

Much of the data used for the exercises and examples was published through the [Dryad Digital Repository](https://datadryad.org/). We want to thank all the scientists who made their data available without restrictions. For each data set, a citation for the original paper and a link to the Dryad record are provided.

## Contacts

For any question, or to signal a bug, typo, etc. please contact us at hello@computingskillsforbiologists.com



