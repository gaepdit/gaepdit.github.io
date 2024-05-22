---
title: New Developer Setup
---

Steps to get set up as a new developer with EPD IT.

## Required online accounts

* Create a [GitHub account](https://github.com/signup) and provide your manager with your user name so you can be added to the EPD-IT team.
* For application developers, request a Raygun account invite.

## Required Git setup

*Setting up Git correctly is very important. Do not skip this step!*

Install the [Git CLI](https://git-scm.com/) then configure Git by running each of the following commands at the command prompt:

* `git config --global user.name "Your Name"`
* `git config --global user.email your.email@dnr.ga.gov`

Add a [global .gitignore file](../git/#git-ignore-files) to your user profile directory.

### Optional Git setup

Setting up an SSH key is not required, but it makes using Git much easier so it is *highly* recommended. Refer to GitHub's [documentation on SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh). It may be cumbersome to set up, but you only have to do it once.

While there, it's also a good idea to set up a [GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification) for signing your commits.

If you use GitKraken, SSH and GPG keys can be quickly set up from the preferences page.

## Software

Install the following software as needed. Some applications require admin access in order to install. Some applications require a license. Discuss licensing needs with your manager.

### For application developers

* [Visual Studio](https://www.visualstudio.com/vs/) - .NET IDE
* [Visual Studio Code](http://code.visualstudio.com/) - Source code editor with IDE features

### For database developers

* [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/) (If you install SSMS, it automatically installs ADS as well.)
* [SQL Server Management Studio (SSMS)](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)

### Additional applications

These are helpful tools for development but are not required.

* [GitKraken](https://www.gitkraken.com/download) - Git GUI
* [Greenshot](http://getgreenshot.org/) - Screenshot tool
* [Inkscape](https://inkscape.org/en/) - Vector graphics editor
* [KDiff3](https://sourceforge.net/projects/kdiff3/files/) - Visual diff/merge editor; highly recommended if using Git
* [Node.js and NPM](http://blog.teamtreehouse.com/install-node-js-npm-windows) - JavaScript runtime and package manager
* [Notepad++](https://notepad-plus-plus.org/) - Source code editor
* [Pandoc](http://pandoc.org/installing.html) - Document format converter
* [Remote Desktop Manager](https://rdm.devolutions.net/home/downloadfree) - Organizes RDP and other remote connections
* [Winget (Windows Package Manager)](https://docs.microsoft.com/en-us/windows/package-manager/winget/) - Winget enables installing and upgrading many applications directly from the command line. Recent versions of Windows come with this built in.
* [ZoomIt](https://docs.microsoft.com/en-us/sysinternals/downloads/zoomit) - Screen zoom and annotation tool; useful for presentations
