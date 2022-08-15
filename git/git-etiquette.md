---
title: Git Etiquette
---

The following are some recommendations that in general make collaboration using Git easier. There may be times when it makes sense to break these rules, and that's fine if you have a good reason to do so.

## Create complete commits

A *complete* (sometimes called *atomic*) commit means that all of the source code updates needed to accomplish a single change are included in a single commit. For example, if you need to change two files to fix one bug, both edits should be included in the same commit. On the other hand, if you're making several unrelated changes, you should create separate commits for each.

## Write good commit messages

A [good commit message](http://chris.beams.io/posts/git-commit/) is a short (<70 characters), capitalized, grammatically complete, summary sentence in the imperative mood. (A rule of thumb for writing in the imperative mood is that the summary sentence will fill in the following blank: "If applied, this commit will _____.") Some examples:

* Fix date formatting on the TPS printout
* Add high-res icons
* Update package to latest release and resolve dependencies

The summary sentence can be followed by additional paragraphs providing more context or information if necessary, separated by blank lines. There can also follow tokens used by issue tracking systems, etc.

## Format your code before you commit

Projects should use an established [coding style](https://www.smashingmagazine.com/2012/10/why-coding-style-matters/). A good coding style has many benefits, and one is that it makes reading Git changesets much easier. If two collaborators follow the same coding style, then each commit will only contain purely functional changes.

Even better is to use tools that automatically format the code for you.

## Create branches for new work

Always create a new Git branch when starting work on a new feature or bugfix. Branches allow you the time and space to work on a change without interfering in other ongoing work on the same project. They also allow you to more easily collaborate with fellow developers.

Maintain a main or default branch that represents the deployed codebase. When a feature/bugfix branch is finished, merge it into the main branch and deploy from there.

*TIP:* If you don't have write access to a project, you will first need to create a fork (copy) of the project. This can be done from the project page on GitHub. Then create a branch in your own fork. Once your work is complete, create a Pull Request from your fork back to the original.
