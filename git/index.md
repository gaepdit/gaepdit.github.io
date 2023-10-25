---
title: Git Resources and Training
---

The Git version control system is required for use with all source code, so make sure you spend some time getting comfortable using it.

## Tutorials

There are plenty of Git tutorials online, and they all take a slightly different approach. Try to find one that fits your learning style. Keep in mind that many are published by companies that also sell Git-related products. These can be very high quality, but might be geared toward highlighting their own products.

* [Introduction to Git from Microsoft Learn](https://docs.microsoft.com/en-us/learn/paths/intro-to-vc-git/)
* [Git Tutorials from Atlassian](https://www.atlassian.com/git/tutorials) (ignore the Bitbucket sections)
* [Git Tutorials from GitKraken](https://www.gitkraken.com/learn/git/tutorials)

## Reference material

* [GitHub Documentation](https://docs.github.com/en/get-started)
* [Git Documentation](https://git-scm.com/doc)
* [Pro Git Book](https://git-scm.com/book/en/v2)

## Git ignore files

Use these links to generate a *global* ".gitignore" file. This file should be added to your user directory (`%userprofile%` on Windows).

* [Windows](https://www.toptal.com/developers/gitignore/api/ssh,windows,microsoftoffice)
* [MacOS](https://www.toptal.com/developers/gitignore/api/ssh,macos,microsoftoffice)

Always add a *project-specific* ".gitignore" file to the root directory of your repository. This file is committed and tracked just like any other file in the repo. The following is the recommended ".gitignore" file for use with .NET application development.

* [.NET project](https://www.toptal.com/developers/gitignore/api/visualstudio,visualstudiocode,jetbrains)

## Tips

You can add shortcuts (called aliases) for commands that you use frequently. Here are some [useful Git aliases](https://gist.github.com/dougwaldron/3b447eca31d4ef3ca6cef1d6a1c8fc67) to get you started.

Run `git config --edit --global` from a command prompt to open and edit your ".gitconfig" file.
