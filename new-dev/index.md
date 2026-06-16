---
title: New Developer Setup
---

Steps to get set up as a new developer with EPD IT.

## Required online accounts

* Create a [GitHub account](https://github.com/signup) and provide your manager with your user name so you can be added to the EPD-IT team.
* For application developers, request a Datadog account invite.

## Required Git setup

**Setting up Git correctly is very important. Do not skip this step!**

1. Run the following command in a command prompt to install the Git CLI:

    `winget install --id Git.Git -e --source winget`

2. Run the following commands to configure Git:

    * `git config --global user.name "Your Name"`
    * `git config --global user.email your.email@dnr.ga.gov`

3. Add a [global .gitignore file](../git/#git-ignore-files) to your user profile directory.

### Optional Git setup

Setting up an SSH key is not required, but it makes using Git much easier so it is *highly* recommended. Refer to GitHub's [documentation on SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh). It may be cumbersome to set up, but you only have to do it once.

While there, it's also a good idea to set up a [GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification) for signing your commits.

If you use GitKraken, SSH and GPG keys can be quickly set up from the preferences page.

## Software

Install the following software as needed. Some applications require admin access in order to install. Some applications require a license. Discuss licensing needs with your manager.

A quick and easy way to install several applications at once is to [automate installation with WinGet/PowerShell](https://gist.github.com/dougwaldron/d510f2d67a922da169aca1aeff7e4c4d).

### For application developers

* [Visual Studio](https://visualstudio.microsoft.com/) - .NET IDE
* [Visual Studio Code](http://code.visualstudio.com/) - Source code editor with IDE features
* [C# Dev Kit extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit)

### For database developers

One of the following:

* [MSSQL extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
* [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install)

### Additional applications

These are helpful tools for development but are not required.

* [GitKraken](https://www.gitkraken.com/download) - Git GUI
* [KDiff3](https://sourceforge.net/projects/kdiff3/files/) - Visual diff/merge editor; highly recommended if using Git
* [Node.js and NPM](http://blog.teamtreehouse.com/install-node-js-npm-windows) - JavaScript runtime and package manager
* [Notepad++](https://notepad-plus-plus.org/) - Source code editor
* [Pandoc](http://pandoc.org/installing.html) - Document format converter
* [Remote Desktop Manager](https://rdm.devolutions.net/home/downloadfree) - Organizes RDP and other remote connections
* [ZoomIt](https://docs.microsoft.com/en-us/sysinternals/downloads/zoomit) - Screen zoom and annotation tool; useful for presentations 

    (This is the standalone version. ZoomIt is now also included with [PowerToys](https://github.com/microsoft/PowerToys) which is also nice.)
