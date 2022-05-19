# HPC-community-docs
## Contributing guidelines

Welcome to the University of Bristol [Advanced Computing Research Centre (ACRC)][acrc-website] HPC community documentation project!
This project provides a space for HPC users at the University of Bristol to publish domain-specific information on how to effectively use HPC facilities managed by the ACRC at the University of Bristol.

Thank you for your interest in contributing! This document collects useful information to assist you through the process of creating and submitting your contribution. 
## CONTENTS

* [Key links](#key-links)
* [In this repository](#in-this-repository)
* [Building the documentation](#building-the-documentation)
* [Modifying and adding to the documentation](#modifying-and-adding-to-the-documentation)
* [Contributing changes to the repository](#contributing-changes-to-the-repository)
* [Deployment of the documentation](#deployment-of-the-documentation)
* [Asking for help](#asking-for-help)

## Key links

* [Documentation website][acrc-hpc-community-docs-website]: HPC community documentation deployed as HTML website
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
### Useful resources
While editing and adding to the documentation, the following resources may be useful to have at hand:

* [MyST Markdown documentation][myst-parser]: syntax and usage of the recommended markup language for documentation source files in this project
* [Sphinx documentation][sphinx-docs]: setup and usage of the tool used to build the documentation
* [Read the Docs Sphinx theme documentation][sphinx_rtd_theme-docs]: setup and usage of the Sphinx theme used in the generated documentation

### Workflow
A typical workflow for working on the documentation is to repeat the following three steps

1. Edit the files in the `source/` directory (add, remove, or change content)
2. [Build the documentation](#running-the-build-process)
3. Review the result in the `build/html/` directory

If the build step fails (e.g. due to a syntax error in the source files), then Sphinx will generally output a meaningful error message to the command line session.
After correcting the error, re-run the build process (`make html`) and continue with the edit-build-review cycle.

### Editing existing pages and adding new pages
To work on an existing page, simply open a source file (usually ending `.md` or `.rst`) in the `source/` directory in a text editor, make changes, and save your changes.

To add a new page to the documentation, create a new source file in the `source/` directory and add some text to it.

To include content in a new page in the table of contents for the documentation, add the [document name][sphinx-document-name] of the file to the [`toctree` directive][sphinx-toctree-directive] in the root document, [`source/index.md`](source/index.md). 
Alternatively, you can add the document name to a `toctree` in another document that is referenced (directly or indirectly) from the `toctree` in the root document.

When the documentation is rebuilt, HTML generated from the edited and/or newly added pages will be included in the result in the `build/` directory.



### Using MyST Markdown
Source documents for the HPC community documentation project can be written using [MyST Markdown][myst-parser] (`.md`) or [reStructuredText][sphinx-rest-primer] (`.rst`).
These are both [lightweight markup languages][wikipedia-lightweight-markup-language].
We recommend using MyST Markdown, unless you have a good reason to use reStructuredText (e.g. you are starting from an existing `.rst` file).
MyST Markdown extends the [CommonMark][commonmark] Markdown specification, to add the capabilities of reStructuredText, while retaining the clean and readable syntax of Markdown.

In addition to the [MyST Markdown documentation][myst-syntax-docs], Jupyter Book's [MyST Markdown cheat sheet][myst-cheatsheet] is a useful quick reference guide for common syntax in technical documentation.

The MyST Markdown documentation does not cover all the Sphinx functionality that can be used in MyST Markdown, but provides [instructions][myst-syntax-docs] on translating from reStructuredText syntax (Sphinx's native markup language) to MyST syntax.
Sphinx/reStructuredText roles and directives documented elsewhere (e.g. in the [Sphinx documentation][sphinx-rest-doc]) can be translated for use in MyST documentation using these instructions.

To simplify editing the documentation, it is advisable to use a text editor or IDE that provides Markdown support (for example syntax highlighting and preview).
Many text editors and IDEs provide Markdown support, or have extensions that add this, so you may already have one installed.
If you do not already have a suitable editor, [Visual Studio Code][vscode] is a good option which [supports Markdown editing and preview][vscode-markdown].
There is also a [MyST Markdown extension for Visual Studio Code][vscode-myst-extension] (developed by [the Executable Book Project][executable-book-project]) that adds additional MyST-Markdown-specific capabilities to the editor.
## Contributing changes to the repository
### Licensing
All text contributions to the documentation project will be licensed under a [Creative Commons Attribution-ShareAlike 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/).
Code snippets and software included in the documentation are published under a MIT license.
See [LICENSE.md](LICENSE.md) for full details.

Before making your contribution, please ensure 
* you are authorized to apply the licenses in [LICENSE.md](LICENSE.md) to your contribution
* you are happy for your contribution to be published under the licenses in [LICENSE.md](LICENSE.md) 

### Workflow
The HPC community documentation project uses the [fork and pull model][fork-and-pull-model] for collaborative development (also known as the [forking workflow][forking-workflow]).
To develop and contribute changes to the documentation:

* Create a [fork][github-docs-forks] of the [HPC-community-docs GitHub repository][acrc-hpc-community-docs-repo] on GitHub
* Clone the forked repository onto your local machine
* Create a feature branch in the forked repository
* Commit additions and changes to the feature branch in the forked repository
* Push the updated feature branch to the forked repository
* When the changes in the feature branch are ready to contribute, [create a pull request from the fork][github-docs-pr-from-fork] which requests merging changes from the feature branch into `main` in the upstream repository
* The pull request will be reviewed by maintainers, and changes/refinements may be requested
* Once the pull request is approved by reviewers, it will be merged into `main`

Additional contributions can be made from the same fork, by creating a new feature branch in the fork.

To keep your fork and feature branches up-to-date, it is recommended to regularly [sync the fork][github-docs-sync-fork] with the upstream (official) repository.
Keeping the `main` branch in your fork synchronised with the `main` branch in the upstream repository ensures contributions from others to the upstream repository are incorporated into the fork.
Merging changes from upstream `main` into active feature branches on your fork helps avoid complex merge conflicts arising when creating a pull request.

## Deployment of the documentation

The HPC community documentation project uses [GitHub Actions][github-docs-actions] to automate building of the documentation into a HTML website and publishing (deployment) of the website.
The website is published using [GitHub Pages][github-pages] at <https://acrc.github.io/HPC-community-docs/>.

The GitHub Actions [workflow][github-docs-actions-workflows] for building and deploying the documentation is defined in [.github/workflows/main.yml](.github/workflows/main.yml).
The workflow is run on a [GitHub-hosted virtual machine ("runner")][github-docs-hosted-runners] whenever commits are pushed to the repository (to any branch) and when a pull request is opened, updated (with new commits), or reopened.
When run, the workflow will always attempt to build the documentation, but will only deploy the built website to GitHub Pages for commits to the `main` branch on the [official repository][acrc-hpc-community-docs-repo].

For a commit pushed to a branch, the workflow will run using the documentation source files present in the pushed commit.
For a pull request, the workflow will run using the source files as they would be if the pull request was merged ([on the `refs/pull/prNumber/merge` branch][github-docs-events-trigger-push]).

Information about current and past workflow runs on the official repository can be viewed in the [Actions tab on the repository GitHub page][acrc-hpc-community-docs-actions].

### Actions on forks
When you create a [fork][github-docs-forks] of the [HPC-community-docs GitHub repository][acrc-hpc-community-docs-repo], GitHub Actions will initially be disabled on the fork.
The fork's Actions tab on GitHub will display a message indicating that workflows are not being run on the forked repository and a button that enables workflows.

Once Actions are enabled on a fork of the HPC community docs repository, the workflow will run in the context of the fork whenever commits are pushed to a branch on that fork.

The [workflow](.github/workflows/main.yml) will build the documentation, but will not deploy the built website to GitHub Pages, even if commits are pushed to the `main` branch of the fork.
This is because the deployment job in the workflow will only run on the `main` branch of the official repository [official repository][acrc-hpc-community-docs-repo].

GitHub Pages is also disabled when creating a fork (see the "Pages" section in the forked repository settings).
The official repository uses the root of the `publishing-source` branch as the [publishing source for GitHub Pages][github-docs-pages-publishing-source] rather than the [default `gh-pages` branch][github-docs-pages-default-publishing-source].
This ensures avoids automatic activation of GitHub Pages when the official repository is forked.

### Do not publish to GitHub Pages on forks!
**Please do not deploy the built documentation to GitHub Pages on your forked version of the official repository!** This can be done by modifying the [workflow file](.github/workflows/main.yml), or activating GitHub Pages and manually committing the built HTML documentation files to the publishing source branch on the fork. Please do not do this.

We ask you not to do this to avoid creating duplicates in search engine results and confusing readers.
If a user's fork publishes documentation to <https://username.github.io/HPC-community-docs/>, then this will result in multiple versions of the HPC community documentation being publicly accessible.
For readers of the documentation, it would be easy to accidentally find and use the version of the documentation published by a fork, rather than the version published from the [official repository][acrc-hpc-community-docs-repo] at .

To ensure the canonical version of the HPC community documentation at <https://acrc.github.io/HPC-community-docs/> is easily findable by users, please do not publish documentation you are working on in a fork to the web.
If you need view the result of a build from an Actions workflow run, you can do this locally by [downloading the a build artifact](#downloading-documentation-build-artifact) for the workflow run.
### Downloading documentation build artifact
<!-- TODO: How to download a zip file containing the built docs (e.g. for actions run on forks or PRs) -->
If you want to check the result of the documentation build job in the Actions workflow, you can download a zip archive containing the built HTML documentation for a given workflow run.
This can be downloaded by selecting a workflow run on the repository Actions tab, then selecting `built-html-docs` under "Artifacts".
The built documentation can be viewed locally by decompressing the archive and opening `index.html` in a web browser, as [described above](#3-view-the-result) (the archive contains the contents of the `build/html/` directory created during the [build process](#running-the-build-process)).

<!-- Mention that this can also be done for workflows run on pull requests -->

## Asking for help
For general queries related to the ACRC and ACRC HPC facilities, please contact the [ACRC team directly][acrc-contact].

If you need assistance with preparing a contribution to the HPC community documentation project, please contact [James C. Womack][uob-directory-jcwomack] ([@jcwomack][github-jcwomack]).

<!-- REFERENCES -->
[acrc-website]: https://www.bristol.ac.uk/acrc/ "Advanced Computing Research Centre bristol.ac.uk website"
[acrc-hpc-community-docs-website]: https://acrc.github.io/HPC-community-docs/ "ACRC HPC community documentation website"
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
[sphinx-document-name]: https://www.sphinx-doc.org/en/master/glossary.html#term-document-name "Sphinx Glossary: document name"
[sphinx-toctree-directive]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-toctree "Sphinx toctree directive"
[wikipedia-lightweight-markup-language]: https://en.wikipedia.org/wiki/Lightweight_markup_language "Wikipedia: Lightweight markup language"
[commonmark]: https://commonmark.org/ "CommonMark"
[sphinx-docs]: https://www.sphinx-doc.org/en/master/contents.html "Sphinx documentation"
[sphinx_rtd_theme-docs]: https://sphinx-rtd-theme.readthedocs.io/en/stable/ "Read the Docs Sphinx theme documentation"
[myst-syntax-docs]: https://myst-parser.readthedocs.io/en/latest/syntax/syntax.html "The MyST Syntax Guide"
[myst-cheatsheet]: https://jupyterbook.org/reference/cheatsheet.html "MyST syntax cheat sheet"
[sphinx-rest-doc]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html "Sphinx reStructuredText documentation"
[vscode-markdown]: https://code.visualstudio.com/docs/languages/markdown "Markdown and Visual Studio Code"
[vscode-myst-extension]: https://marketplace.visualstudio.com/items?itemName=ExecutableBookProject.myst-highlight "MyST-Markdown VS Code extension"
[executable-book-project]: https://executablebooks.org/ "The Executable Book Project"
[fork-and-pull-model]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/getting-started/about-collaborative-development-models#fork-and-pull-model "Fork and pull model"
[forking-workflow]: https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow "Forking Workflow"
[acrc-hpc-community-docs-repo]: https://github.com/ACRC/HPC-community-docs "ACRC HPC community documentation GitHub repository"
[github-docs-forks]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks "Working with forks"
[github-docs-pr-from-fork]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork "Creating a pull request from a fork"
[github-docs-sync-fork]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork "Syncing a fork" 
[acrc-contact]: https://www.bristol.ac.uk/acrc/contact/ "Contact the ACRC"
[uob-directory-jcwomack]: https://www.bris.ac.uk/contact/person/getDetails?personKey=kbwP3F8vd3QrkvAdDAYPnFXOILXiny "James C. Womack at University of Bristol"
[github-jcwomack]: https://github.com/jcwomack "James C. Womack on GitHub"
[github-docs-actions]: https://docs.github.com/en/actions "GitHub Actions"
[github-pages]: https://pages.github.com/ "GitHub Pages"
[github-docs-actions-workflows]: https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions#workflows "Workflows"
[github-docs-hosted-runners]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners "About GitHub-hosted runners"
[github-docs-events-trigger-push]: https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#pull_request "Events that trigger workflows: pull_request"
[acrc-hpc-community-docs-actions]: https://github.com/ACRC/HPC-community-docs/actions "ACRC HPC community documentation GitHub Actions"
[github-docs-pages-publishing-source]: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site "Configuring a publishing source for your GitHub Pages site"
[github-docs-pages-default-publishing-source]: https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#publishing-sources-for-github-pages-sites