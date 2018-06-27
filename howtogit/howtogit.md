*not currrently github-flavored-mdown-friendly*

# Git-flow

[comment]: # "This is a highly portable, invisible comment in markdown"

Table of contents
* [Creating a repo](#creating-a-repo)
* [Creating a remote repo](#creating-a-remote-repo)
* [Staging changes](#staging-changes)
* [Commiting changes](#commiting-changes)
* [Creating a branch](#creating-a-branch)
* [Tracking branches](#tracking-branches)
* [Merging a branch](#merging-a-branch)
* [Rebasing a branch](#rebasing-a-branch)
* [Reseting](#reseting)
* [Reverting](#reverting)
* [Fixing bad merging](#fixing-bad-merging)
* [Stashing changes](#stashing-changes)
* [.gitignore](#.gitignore)
* [Fix untracked files after .gitignore](#fix-untracked-files-after-.gitignore)
* [Bare repo and its purpose](#bare-repo-and-its-purpose)
* [](#)
* [](#)

![Something went wrong, this should be a picture!][logo]

[logo]: http://www.geo.uzh.ch/microsite/reproducible_research/post/rr-eclipse-git/img/git-transport.png "Git Movement"
<a name="creating-a-repo">
#### Creating a repo
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

<a name="creating-a-remote-repo">
#### Creating a remote repo
</a>

After `git init`, use the command `git remote add [remoteName] [url]`
```Bash
$ git remote add origin 
https://github.com/kingarthur/england
$ git remote --verbose
origin	https://github.com/kingarthur/england.git (fetch)
origin	https://github.com/kingarthur/england (push)
```

<a name="staging-changes">
#### Staging changes 
</a>

Using the command `git add [directory/file.type]` you can add a file to the staging area. If a file was removedfrom the workspace, the parallel function `git rm [file]` will set the staging area to remove that file from the git repositoy.

```Bash
$ git rm excalibur.stone
rm 'excalibur.stone'
```

<a name="commiting-changes">
#### Commiting changes
</a>

Put on your big boy pants, we're about to commit! In order to move your changes from the index or staging area to the local repository, use the command `git commit -m"[commit message]"` 

```Bash
$ git commit -m"removed excalibur"
[feature_branch 94ef3b4] removed excalibur
 1 file changed, 1 deletion(-)
 delete mode 100644 excalibur.txt

```

<a name="creating-a-branch">
#### Creating a branch
</a>

<a name="tracking-branches">
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

<a name="merging-a-branch">
#### Merging a Branch
</a>


<a name="rebasing-a-branch">
#### Rebasing a branch
</a>

<a name="reseting">
#### Reseting
</a>


<a name="reverting">
#### Reverting
</a>


<a name="fixing-bad-merging">
#### Fixing bad merging
</a>

##### Accidental merging onto master

This is a very simple issue to fix as long as you havent made any new commits yet. Your current repo looks something like this:

```
develop   B --  C  --  D
         /             *\* 
master  A -- A1 -- A2 -- E
```
Where the asterix mark the accidental merge commit. In order to fix this issue, simply use `git reset --hard HEAD~`. Your git history will revert, and looks like this.

```
develop   B -- C -- D
         /              
master  A -- A1 -- A2 
```


##### Commiting master after merging

Let's say you made some changes in a `feature` branch, merged them into your `develop` branch "G", and then after a few bug fixes in the `develop` branch, you merged it into `master` "H". Noticing a typo here or there in that final merge, you make your changes in `master` and create a third commit "I". When you return to your `develop` or `feature` branches, you might be suprised to see your typo fixes aren't there.

```
feature          D -- E -- F
                /           \
develop   B -- C --- --- --- G
         /                    \
master  A --- --- --- --- ---  H -- I
```
###### The misleading portion of this diagram is the notion that both of our branches  exist on a level that is either somehow above or apart from master. Git stores changes as a tree. When we merge the tree(branch) into master, it ties into it.

With your new found `git merge` powers, you attempt to send your changes "upstream" to your branches(the mistake/idea being that branches are divergent from HEAD at all times and thereore upstream) with the command `git merge master develop`. Alas, git is stubborn and tells you `Already up-to-date`.

As the diagram shows, `feature` and `develop` are in the same state "H" they were before your typo fixing commit "I". Also, both of these branches are now *parents* of `master`. The branches are up-to-date with master because all previous changes made in the branches are present in master.

Okay, so we understand the problem. In order to unfuck your git repo, your best option is to use `git rebase master` on your `develop` or `feature` branch. This will destroy your formal git history, and is unadvised when working in a team, but so is merging all your branches onto master and then editing on master.

```Bash
$ git checkout develop
witched to branch 'develop'
$git rebase master
First, rewinding head to replay your work on top of it...
Fast-forwarded develop to master.
```

<a name="rebasing-a-branch">
#### Rebasing a branch
</a>

<a name="stashing-changes">
#### Stashing changes
</a>


<a name=".gitignore">
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

<a name="fix-untracked-files-after-.gitignore">
#### Fix untracked files after .gitignore
</a>
Now that your .gitignore is set up just as described, you might wonder why the files you intended to ignore of are still showing as untracked. This is due to how git invokes the rules specified in your .gitignore, which happens either when you run `git init` or a new file that falls under the .gitignore rules is created.

In order to stifle `git status` from these files, first go to your top directory in your git repo, remove the cached changes with the recursive argument, add the whole directory to the staging area, and commit.

```Bash
$ cd top/repo/dir
$ git rm -r --cached .
rm 'swordinthestone.py'
$git add .
$git commit -m "hotfix to support upstream changes made by ladyofthelake"
```

<a name="">
####
</a>

<a name="bare-repo-and-its-purpose">
#### Bare repo and its purpose
</a>

Bare repos are special and can be created 
<a name="">
#### 
</a>
