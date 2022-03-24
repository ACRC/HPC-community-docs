# HPC-community-docs
## Contributing guidelines

Welcome to the University of Bristol [Advanced Computing Research Centre (ACRC)][acrc-website] HPC community documentation project!
This project provides a space for HPC users at the University of Bristol to publish domain-specific information on how to effectively use HPC facilities managed by the ACRC at the University of Bristol.

This document contains instructions for those who wish to contribute to the documentation. 

We are very happy to receive contributions from HPC users at the University of Bristol.

## CONTENTS

* [Key links](#key-links)
* [In this repository](#in-this-repository)
* [Building the documentation](#building-the-documentation)
* [Modifying and adding to the documentation](#modifying-and-adding-to-the-documentation)
* [Contributing changes to the repository](#contributing-changes-to-the-repository)
* [Asking for help](#asking-for-help)

## Key links

* [README.md](README.md): general information about the repository and documentation project
* [LICENSE.md](LICENSE.md): licenses for content in the repository
* [Issues][acrc-hpc-community-docs-issues]: the place to raise and discuss bugs, issues, enhancements
* [humans.txt](humans.txt): information about project contributors

## In this repository
The HPC-community-docs repository contains 

* Documentation source files in [MyST Markdown][myst-parser] ([reStructuredText][sphinx-rest-primer] is also supported)
* [Sphinx][sphinx] project files for running and configuring the documentation build process
* A [Conda][conda] environment file specifying the packages required to build the documentation

## Building the documentation
Building the documentation generates the documentation in a user-friendly output format, such as a HTML website or PDF file, from the source files.

### Setting up the build system
To build the documentation on your own computer, you must install [Sphinx][sphinx] and some other supporting packages.

The simplest way to do this is to create a [Conda][conda] environment using the provided [environment.yml](environment.yml) file. 
This will create an isolated software environment containing all the packages required to build the documentation.

#### 1. Install the Conda package manager
Creating a Conda environment requires the [Conda][conda] package manager. If the `conda` command is already available on your computer (e.g. from an installation of the [Anaconda distribution][anaconda]), you can skip to the next step. Otherwise, you can install `conda` by downloading and installing [Miniconda3][miniconda] for your operating system, following the instructions in [the Conda documentation][conda-install].

#### 2. Clone the repository
Create a clone of this repository on your computer. This can be done using Git on the command line, e.g. running the following command
```ShellSession
git clone https://github.com/ACRC/HPC-community-docs.git
```
will create a clone of the repository in the current directory. Alternatively, use an IDE like [VSCode][vscode] or a [Git GUI client][git-guis] such as [GitHub Desktop][github-desktop] to clone the repository.

> **NOTE:** If `git clone` fails with an error indicating that the `git` command cannot be found, then you may need to install Git on your computer. 
> For instructions for installing Git on Linux, macOS, or Windows, see the section ["Installing Git"][pro-git-install] in the free online [Pro Git book][pro-git].

#### 3. Create a Conda environment
Once the repository is cloned, start a command line session and change to the repository directory (`HPC-community-docs`). A conda environment file `environment.yml` should be present in the directory.

Create the conda environment using the command
```ShellSession
conda env create --file environment.yml
```
This will create a new conda environment called `HPC-community-docs-env`, with Sphinx and supporting packages installed.

> **NOTE:** If you are using Windows and `conda` commands fail with an error indicating that the `conda` command cannot be found, you may need to launch your command line session using the "Anaconda Prompt" or "Anaconda PowerShell Prompt" Start menu items.
> Launching the command line session in this way ensures that the session environment is set up correctly to use `conda`.

#### 4. Check the environment
To check that the environment has been successfully created, activate it
```ShellSession
conda activate HPC-community-docs-env
```
Your command line prompt should now be prefixed by the environment name in brackets: `(HPC-community-docs-env)`.

With `HPC-community-docs-env` activated, check that Sphinx is installed by running
```ShellSession
sphinx-build --version
```
If Sphinx has been installed in the environment, the command should output the version number, e.g.
```ShellSession
sphinx-build 4.4.0
```

When you have finished working with the environment, you can close it using
```Shell
conda deactivate
```

### Running the build process
After cloning the repository and creating the `HPC-community-docs-env` Conda environment, you should be able to build the documentation on your computer. 
The following instructions describe how to build the documentation into a HTML website, viewable in a web browser.

#### 1. Activate the environment
Start a command line session, change to the repository directory (`HPC-community-docs-env`) and activate the environment using
```ShellSession
conda activate HPC-community-docs-env
```

#### 2. Generate the documentation
Run the command
```ShellSession
make html
```
This will build HTML pages based on the source documents in the `source` directory, placing the result in the `build/html` directory.

> **NOTE** If `make html` fails with an error indicating that the `make` command cannot be found, then the build can be run using the command
> ```Shell
> sphinx-build -M html source build
> ```
> (the `sphinx-build` command is invoked by `make` behind the scenes).

#### 3. View the result
To view the result of the build process, open `build/html/index.html` in a web browser.
If the build process was successful, the browser should display a browsable website containing formatted text from the source files in `source`. 

It is also possible to build the documentation in other formats, e.g. PDF (see the [documentation for `sphinx-build`][sphinx-build] for a list of common build formats). Since the HPC community documentation is intended to be built as a website, we will only consider the [HTML builder][sphinx-builders] here.

> **NOTE** The generated documentation can be opened directly in your default browser from a command line session. From the repository directory, on macOS use
> ```Shell
> open build/html/index.html
> ```
> and on Windows PowerShell
> ```PowerShell
> Invoke-Item .\build\html\index.html
> ```
> For Linux,
> ```Shell
> xdg-open build/html/index.html
> ```
> may work if your distribution provides it.

## Modifying and adding to the documentation

% TODO

## Contributing changes to the repository

% TODO

## Asking for help

% TODO

% REFERENCES
[acrc-website]: https://www.bristol.ac.uk/acrc/ "Advanced Computing Research Centre bristol.ac.uk website"
[acrc-hpc-community-docs-issues]: https://github.com/ACRC/HPC-community-docs/issues "ACRC HPC community documentation GitHub Issues"
[myst-parser]: https://myst-parser.readthedocs.io/en/latest/ "MyST - Markedly Structured Text"
[sphinx-rest-primer]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html "Sphinx reStructuredText Primer"
[sphinx]: https://www.sphinx-doc.org "Sphinx documentation generator"
[conda]: https://conda.io/projects/conda/en/latest/index.html "Conda package manager"
[anaconda]: https://www.anaconda.com/ "Anaconda"
[miniconda]: https://docs.conda.io/en/latest/miniconda.html "Miniconda"
[conda-install]: https://conda.io/projects/conda/en/latest/user-guide/install/index.html "Conda installation instructions"
[vscode]: https://code.visualstudio.com/ "Visual Studio Code"
[git-guis]: https://git-scm.com/downloads/guis "Git GUI clients"
[github-desktop]: https://desktop.github.com/ "GitHub Desktop"
[pro-git-install]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "Pro Git: 1.5 Getting Started - Installing Git"
[pro-git]: https://git-scm.com/book/en/v2 "Pro Git"
[sphinx-build]: https://www.sphinx-doc.org/en/master/man/sphinx-build.html "sphinx-build command"
[sphinx-builders]: https://www.sphinx-doc.org/en/master/usage/builders/index.html "Sphinx builders"