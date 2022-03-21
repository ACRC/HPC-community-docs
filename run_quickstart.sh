#!/bin/bash
# Runs sphinx-quickstart to build the source directory containing source files 
# for a Sphinx project. The command options are recorded here so that they can 
# easily be reproduced/modified if a new source directory is required.
PROJECT_NAME="ACRC HPC community documentation"
AUTHORS="University of Bristol ACRC and researchers"
LANGUAGE="en"
EXTENSIONS="myst_parser,sphinx_rtd_theme"

sphinx-quickstart . --sep \
 --project="${PROJECT_NAME}" \
 --author="${AUTHORS}" \
 --language="${LANGUAGE}" \
 --extensions="${EXTENSIONS}" \
 --use-make-mode

# NOTES:
# The --sep option causes Sphinx to create a separate "source" and "build"
# directory in the project root.
#
# The --use-make-mode option specifies that the generated Makefile/make.bat
# should use make mode (https://www.sphinx-doc.org/en/master/man/sphinx-build.html#make-mode)
#
# To use MyST Markdown for the root document, rather than reStructuredText,
# replace index.rst with index.md after running sphinx-quickstart.