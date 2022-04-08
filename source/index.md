---
title: "ACRC HPC community documentation"
---
% ACRC HPC community documentation documentation master file, created by
% sphinx-quickstart on Mon Mar 21 14:51:22 2022.
% You can adapt this file completely to your liking, but it should at least
% contain the root `toctree` directive.
%
% Converted from reStructuredText to MyST Markdown

Temporary modification to force site deployment to GitHub Pages
## Introduction
Welcome to the University of Bristol [Advanced Computing Research Centre (ACRC)][acrc-website] HPC community documentation project!
Here you will find documentation contributed by HPC users at the University of Bristol, providing domain-specific information on how to effectively use HPC facilities managed by the ACRC at the University of Bristol.

For general information and guides related to accessing and using ACRC HPC facilities, please see the [ACRC HPC Documentation and User Guides][acrc-hpc-user-docs] (University of Bristol login required).

The HPC community documentation is complementary to the [ACRC HPC Documentation and User Guides][acrc-hpc-user-docs]. 
It provides a space for user-contributed specialist documentation relating to particular research areas. 
For example, documentation for a research software packages used in particular domain might include:

* Example job submission scripts for the package
* Running the software efficiently on the HPC facilities 
* Compiling/building the software for the HPC facilities
* Workflows for collecting and analysing of software outputs 
* Workarounds or solutions for commonly encountered problems

## Contributing
We are very happy to receive contributions from HPC users at the University of Bristol. If you would like to add to or edit the HPC community documentation, please follow the guidance in [CONTRIBUTING.md](https://github.com/ACRC/HPC-community-docs/blob/main/CONTRIBUTING.md) in our [GitHub repository][acrc-hpc-community-docs-github].

## Issues, feedback, and questions
If you notice a problem with the documentation or have suggestions on how it could be improved, please open an [issue][acrc-hpc-community-docs-issues] or suggest changes through a [pull request][acrc-hpc-community-docs-prs].

For general queries related to the ACRC and ACRC HPC facilities, please contact the [ACRC team directly][acrc-contact].

```{toctree}
---
maxdepth: 2
caption: "Contents:"
---
example-domain/index
```

# Credits and licenses
The idea for the HPC community documentation project was conceived by the University of Bristol HPC Users Group, and the infrastructure for the website was set up on behalf of the HPC Users Group by James C. Womack.

The HPC community documentation consists of contributions from HPC users at the University of Bristol.
For a list of current contributors, see our [humans.txt][humanstxt-file] (see [humanstxt.org][humanstxt-website] for information about the `humans.txt` format).   

All text is licensed under a [CC BY-SA 4.0 license][cc-by-sa-4]. All software and code snippets are licensed under a MIT license.
See [LICENSE.md][acrc-hpc-community-docs-license] in the [GitHub repository][acrc-hpc-community-docs-github] for full details.

% REFERENCES
[acrc-website]: https://www.bristol.ac.uk/acrc/ "Advanced Computing Research Centre bristol.ac.uk website"
[acrc-hpc-user-docs]: https://www.acrc.bris.ac.uk/protected/hpc-docs/index.html "ACRC HPC Documentation and User Guides"
[acrc-hpc-community-docs-github]: https://github.com/ACRC/HPC-community-docs "ACRC HPC community documentation GitHub repository"
[acrc-hpc-community-docs-issues]: https://github.com/ACRC/HPC-community-docs/issues "ACRC HPC community documentation GitHub Issues"
[acrc-hpc-community-docs-prs]: https://github.com/ACRC/HPC-community-docs/pulls "ACRC HPC community documentation GitHub Pull requests"
[acrc-contact]: https://www.bristol.ac.uk/acrc/contact/ "Contact the ACRC"
% TODO Update humans.txt to production repository URL (when deploying to production repository)
[humanstxt-file]: https://jcwomack.github.io/HPC-community-docs/humans.txt "humans.txt"
[humanstxt-website]: https://humanstxt.org "Humans TXT website"
[cc-by-sa-4]: https://creativecommons.org/licenses/by-sa/4.0/ "CC BY-SA 4.0 license"
[acrc-hpc-community-docs-license]: https://github.com/ACRC/HPC-community-docs/blob/main/LICENSE.md "ACRC HPC community documentation LICENSE.md"