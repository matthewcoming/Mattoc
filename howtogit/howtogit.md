*not currrently github-flavored-mdown-friendly*

# Git-flow

[comment]: # "This is a highly portable, invisible comment in markdown"

Table of contents
* [Creating a repo](#creatingarepo)
* [Creating a remote repo](#creatingaremoterepo)
* [Staging changes](#stagingchanges)
* [Commiting changes](#commitingchanges)
* [Creating a branch](#creatingabranch)
* [Tracking branches](#trackingbranches)
* [Merging a branch](#mergingabranch)
* [Rebasing a branch](#rebasingabranch)
* [Stashing changes](#stashingchanges)
* [.gitignore](#gitignore)
* [Fix untracked files after .gitignore](#fixuntrackedfiles)
* [Bare repo and its purpose](#barerepoanditspurpose)
* [](#)
* [](#)
* [](#)
* [](#)
* [](#)

![Something went wrong, this should be a picture!][logo]

[logo]: http://www.geo.uzh.ch/microsite/reproducible_research/post/rr-eclipse-git/img/git-transport.png "Git Movement"
<a name="creatingarepo">
#### Creating a Repo
</a>

1. Go to your desired path 

```Bash
$ cd ~/here/be/dragons
```

2. Create a repository using the command `git init`

```Bash
$ git init
Initialized empty Git repository in home/here/be/dragons/.git/
```

<a name="creatingaremoterepo">
### Creating a remote repo
</a>

After `git init`, use the command `git remote add [remoteName] [url]`
```Bash
$ git remote add origin https://github.com/matthewcoming/mattoc
$ git remote --verbose
origin	https://github.com/matthewcoming/mattoc.git (fetch)
origin	https://github.com/matthewcoming/mattoc.git (push)
```

<a name="stagingchanges">
#### Staging changes 
</a>

Using the command `git add [directory/file.type]` you can add a file to the staging area. If a file was removedfrom the workspace, the parallel function `git rm [file]` will set the staging area to remove that file from the git repositoy.

```Bash
$ git rm excalibur.stone
rm 'excalibur.stone'
```

<a name="commitingchanges">
#### Commiting changes
</a>

Put on your big boy pants, we're about to commit! In order to move your changes from the index or staging area to the local repository, use the command `git commit -m"[commit message]"` 

```Bash
$ git commit -m"removed excalibur"
[feature_branch 94ef3b4] removed excalibur
 1 file changed, 1 deletion(-)
 delete mode 100644 excalibur.txt

```

<a name="creatingabranch">
#### Creating a branch
</a>

<a name="trackingbranches">
#### Tracking branches
</a>

If you would like to create a branch that is remotely tracked from the start **AND** have them share the same name, use the command `git checkout -b [branch] [remotename]/[branch]` or `git checkout --track [remotename/[branch]`
```Bash
$ git checkout --track origin/hotfix
Branch hotfix set up to track remote branch refs/remote/origin/hotfix.
Switched to a new branch "hotfix"
```
If you would like to 
```Bash
$ git checkout --track origin/develop
```

<a name="mergingabranch">
#### Merging a Branch
</a>

<a name="rebasingabranch">
#### Rebasing a branch
</a>

<a name="stashingchanges">
#### Stashing changes
</a>


<a name="gitignore">
#### .gitignore
</a>

This is rather simple. If you notice there are temporary files that you are constantly adding and commiting, and understand that they are not vital, you might want to prevent git from tracking them.

Simply create a file `.gitignore` in the base directory of your git repo, and type the files or directories you would like git to ignore
```Bash
$ echo "welsh/legend/" > .gitignore
```

It is also possible an often more useful to create a `.gitignore_global` file in your home directory. This works just the same as before, but now all your git repos will obey the rules set out in this file aswell.
```Bash
$ cd
$ echo "irish/legend" > .gitignore_global
```

<a name="fixuntrackedfiles">
#### Fix untracked files after .gitignore
</a>
Now that your .gitignore is set up just as described, you might wonder why the files you intended to ignore of are still showing as untracked. This is due to how git invokes the rules specified in your .gitignore, which happens either when you run `git init` or a new file that falls under the .gitignore rules is created.

In order to stifle `git status` from these files, first go to your top directory in your git repo, remove the cached changes with the recursive argument, add the whole directory to the staging area, and commit.

```Bash
$ cd top/repo/dir
$ git rm -r --cached .
rm 'swordinthestone.py'
$git add .
$git commit -m "hotfix to support  upstream changes made by ladyofthelake"
```

<a name="">
####
</a>

<a name="barerepoanditspurpose">
#### Bare repo and its purpose
</a>

Bare repos are special and can be created 
<a name="">
#### 
</a>
