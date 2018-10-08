# Git-flow

[comment]: # "This is a highly portable, invisible comment in markdown"

Table of contents
* [Creating a repo](#creating-a-repo)
* [Creating a remote repo](#creating-a-remote-repo)
* [Staging changes](#staging-changes)
* [Committing changes](#committing-changes)
* [Creating a branch](#creating-a-branch)
* [Tracking branches](#tracking-branches)
* [Merging a branch](#merging-a-branch)
* [Rebasing a branch](#rebasing-a-branch)
* [Resetting](#resetting)
* [Reverting](#reverting)
* [Fixing bad merging](#fixing-bad-merging)
* [Stashing changes](#stashing-changes)
* [.gitignore](#.gitignore)
* [Fix untracked files after .gitignore](#fix-untracked-files-after-.gitignore)

![Something went wrong, this should be a picture!][logo]

[logo]: http://www.geo.uzh.ch/microsite/reproducible_research/post/rr-eclipse-git/img/git-transport.png "Git Movement"
<a name="creating-a-repo">

 #### Creating a repo
</a>

Go to your desired path,
```Bash
$ cd ~/here/be/dragons
```
and create a repository using the command `git init`

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

Using the command `git add [directory/file.type]` you can add a files changes to the staging area.

```Bash
$ git add kingarthur.py
```

If a file was removed from the workspace, the parallel function `git rm [file]` will set the staging area to remove that file from the git repository.

```Bash
$ git rm excalibur.stone
rm 'excalibur.stone'
```

<a name="committing-changes">

#### Committing changes
</a>

Put on your big boy pants, we're about to commit! In order to move your changes from the index (AKA the staging area) to the local repository, use the command `git commit -m"[commit message]"`

```Bash
$ git commit -m"removed excalibur"
[feature_branch 94ef3b4] removed excalibur
 1 file changed, 1 deletion(-)
 delete mode 100644 excalibur.txt
```

<a name="creating-a-branch">

#### Creating a branch
</a>

Let's say you have a great idea on how to change your project, but it's quite destructive and you're not even sure it will work. Traditionally, you would back up your whole project, but that might be cumbersome depending on its size, and what happens if you make several good changes along with several bad ones? This is where a git branch comes in handy. 

This is the most often used, as well as most useful, feature of git. By creating a branch, you also create a 'fork' in your projects git history. From this fork forward, the main trunk of your project, `master`, will be unaffected by the any changes made in your new branch, `sidequest`. 

```Bash
$ git branch sidequest
$ git checkout sidequest
Switched to branch 'sidequest'
```

Condensed to a one liner:
```Bash
$ git checkout -b sidequest
Switched to a new branch 'sidequest'
```

<a name="tracking-branches">

#### Tracking branches
</a>

If you would like to create a branch that is remotely tracked from the start **AND** have them share the same name, use the command `git checkout -b [branch] [remoteName]/[branch]` or `git checkout --track [remoteName/[branch]`
```Bash
$ git checkout --track origin/hotfix
Branch hotfix set up to track remote branch refs/remote/origin/hotfix.
Switched to a new branch "hotfix"
```

<a name="merging-a-branch">

#### Merging a Branch
</a>

Merging is the process of taking all of the changes made in one branch, and **merging** them into the changes of another branch(this is not to say the other branch has diverged or changed since their fork. It is to say, however, that a git commit is just record of changes since the previous commit). You will want to `commit` your changes in your `development` branch, `checkout` the branch that will be receive the changes from `development` (usually `master`), and `merge development`.

```Bash
(branch +%)$ git commit -m"Merlins prophecy"
[develop c0870d6] Merlins prophecy
 1 file changed, 20 insertions(+), 1 deletion(-)
(branch %)$ git checkout master
(master %)$ git merge branch
Updating c0870d6..36240e8
Fast-forward
 kingarthur/merlinsquest.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)
```

<a name="rebasing-a-branch">

#### Rebasing a branch
</a>

`git rebase [branch]` will take the currently checked out branch and move its origin or "base" to the beginning of [branch].

Rebasing is dangerous. It can act destructively, and by virtue of how it works, will complete re-write the repo history. When should you do it? Only if you are the only one to ever work on, or ever even know of this projects existence.

```Bash
$ git rebase master
First, rewinding head to replay your work on top of it...
Fast-forwarded develop to master.
```

<a name="resetting">

#### Resetting
</a>
Yet to be created, read a little in [Fixing bad merging](#fixing-bad-merging)

<a name="reverting">

### Reverting
</a>
yet to be created

<a name="fixing-bad-merging">

#### Fixing bad merging
</a>

##### Accidental merging onto master

This is a very simple issue to fix as long as you haven't made any new commits yet. Your current repo looks something like this:

```
develop   B --  C  --  D
         /             *\*
master  A -- A1 -- A2 -- E
```
Where the asterisk mark the accidental merge commit. In order to fix this issue, simply use `git reset --hard HEAD~`. Your git history will revert, and looks like this.

```
develop   B -- C -- D
         /
master  A -- A1 -- A2
```


##### Committing master after merging

Let's say you made some changes in a `feature` branch, merged them into your `develop` branch "G", and then after a few bug fixes in the `develop` branch, you merged it into `master` "H". Noticing a typo here or there in that final merge, you make your changes in `master` and create a third commit "I". When you return to your `develop` or `feature` branches, you might be surprised to see your typo fixes aren't there.

```
feature          D -- E -- F
                /           \
develop   B -- C --- --- --- G
         /                    \
master  A --- --- --- --- ---  H -- I
```
###### The misleading portion of this diagram is the notion that both of our branches  exist on a level that is either somehow above or apart from master. Git stores changes as a tree. When we merge the tree(branch) into master, it ties into it.

With your new found `git merge` powers, you attempt to send your changes "upstream" to your branches(the mistake/idea being that branches are divergent from HEAD at all times and therefore upstream) with the command `git merge master develop`. Alas, git is stubborn and tells you `Already up-to-date`.

As the diagram shows, `feature` and `develop` are in the same state "H" they were before your typo fixing commit "I". Also, both of these branches are now *parents* of `master`. The branches are up-to-date with master because all previous changes made in the branches are present in master.

Okay, so we understand the problem. In order to unfuck your git repo, your best option is to either:

1. Resetting HEAD, checking out develop, and committing

```BASH
$ git reset --soft HEAD^
$ git checkout develop
$ git commit -m"message"
```

2. Deleting and recreating the branch


You've merged this branch back into master. If you're working alone, then your git history isn't all that important, so deleting the branch and recreating it in master will put your most recent changes into the new develop.

```Bash
$ git branch -d develop
$ git checkout -b develop
```

3. `git rebase master`

If you can avoid this, avoid it.

`git rebase master` on your `develop` or `feature` branch. This will destroy your formal git history, and is unadvised when working in a team, but so is merging all your branches onto master and then editing on master.

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
Yet to be created
<a name="stashing-changes">

#### Stashing changes
</a>
Yet to be created

<a name=".gitignore">

#### .gitignore
</a>

This is rather simple. If you notice there are temporary files that you are constantly adding and committing, and understand that they are not vital, you might want to prevent git from tracking them.

Simply create a file `.gitignore` in the base directory of your git repo, and type the files or directories you would like git to ignore
```Bash
$ echo "welsh/legend/" > .gitignore
```

It is also possible an often more useful to create a `.gitignore_global` file in your home directory. This works just the same as before, but now all your git repos will obey the rules set out in this file as well.
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

