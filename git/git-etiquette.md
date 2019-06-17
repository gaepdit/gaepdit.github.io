---
title: Git Etiquette
---

# Git Etiquette

A set of best practices for collaborating using Git. Best practices here means that these are recommendations that in general make collaboration easier. There may be times when it makes sense to break one of these rules, and that's fine. Just make sure you have a good reason to do so.

## Commits should be short and complete

*Short* means "not too long," and *complete* means "not too short". Or to put it more verbosely:

* *Complete* (sometimes called *atomic*) commits means that a single feature or bug fix should ideally not be split among several commits. For example, If you need to change two files to fix one bug, both changes should be included in a single commit.

* *Short* means each commit should *only* include one new feature or bug fix. Don't pile multiple features, bug-fixes, and formatting changes in a single commit.

In other words, each commit should represent a "before" and "after" state of the code, not a "during".

## Write good commit messages

A [good commit message](http://chris.beams.io/posts/git-commit/) is a short (<70 characters), capitalized, grammatically complete, summary sentence in the imperative mood. A rule of thumb for writing in the imperative mood is that the summary sentence will fill in the following blank: "If applied, this commit will _____." For example,

* Fix date formatting on the TPS printout
* Add high-res toolbar icons
* Update jQuery to latest release and resolve dependencies

The summary sentence can be followed by additional paragraphs providing more context or information if necessary, separated by blank lines. There can also follow tokens used by issue tracking systems, etc.

## Format your code before you commit

Projects should establish a code style from the beginning. (See [Why Coding Style Matters – Smashing Magazine](https://www.smashingmagazine.com/2012/10/why-coding-style-matters/).) A good coding style has many benefits, and one is that it makes reading Git changesets much easier. If two collaborators follow the same coding style, then each commit will only contain purely functional changes.

Even better is to use tools that automatically format the code for you.

If you need to reformat a file that has already been committed, *never* combine formatting changes and functional changes in the same commit.

## Prefer rebase over merge

This is mainly an issue that arises when two devs are working on the same branch. After committing some changes, you find you can't push your new commits to Bitbucket because your partner has already pushed to the same branch, and your local branch is now behind the remote branch. 

The usual way of dealing with this is to pull the remote changes, merge, and then push the merged code back to Bitbucket.

But if your commits are short and complete, this method creates untidy and unnecessary merge commits. Setting your tool to automatically rebase instead of merge when pulling from the remote branch will eliminate the unnecessary merge commits, resulting in a cleaner commit timeline.

Note: Rebasing does not increase or decrease the chances of a merge conflict. Conflicts will have to be resolved exactly the same way in both methods.

## Create branches

If you need more time and space to work on a change, or you feel like the change you are working on should be spread across multiple commits, or you want to commit an unfinished work in progress to request help from a fellow developer, *create a branch.*

Branching is cheap and easy in Git. Create a branch and push it to GitLab. Others can check out that branch and see the current state of your work. They can add commits that you can pull. Create multiple branches if you need to work on multiple features. Branches can be deleted or merged so there is little risk.

And none of this violates the rule to keep commits short and complete, because when you merge your crazy long branch back into master, it's only the merge commit that matters. In other words, the entire branch that is merged can be considered a single merge action fulfilling the above rule. It is the merge commit itself that represents the "before" and "after" state of the main branch.

But make sure you only merge into master once the change is complete and ready to be released because the master branch should always build.

## The master branch should always build

No one expects bug-free code, so this is not to say the master branch should be free from defects. But every attempt should be made to maintain the master branch in a build-able, ship-able state.

This is just another way of saying, if you need more time and space to work on a change, create a branch.

## Don't work with old code

When starting new work (whether creating a new branch or not), do a `fetch` or `pull` first to make sure you have the latest version of the codebase. If you start with out-of-date code, you are more likely to encounter merge conflicts when you're finished. Plus, you might be recreating code that already exists!

## Don't rewrite the commit message when merging

Your Git tool should create a default merge commit message, something like "Merge branch x into y", with maybe some extra lines describing merge Conflicts that had to be resolved. Don't rewrite it unless the default message is actually inaccurate.

## Add a `.gitignore` file to all repositories

Always add a project-specific `.gitignore` file to the root directory of your repository. This file is committed and tracked just like any other file in the repo.

When you create a new project in Visual Studio and tell it to use Git for version control, Visual Studio will automatically add a very useful `.gitignore` file. If you are working with an existing project, you can find useful suggestions online, such as at [gitignore.io](https://www.gitignore.io/). There is also a recommended `.gitignore` file in this repo.
