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
* [](#)
* [Bare repo and its purpose](#barerepoanditspurpose)
* [](#)

![alt text][logo]

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
[feature_branch 94ef3b4] added latex documents and resume into their respective directories
 1 file changed, 1 deletion(-)
 delete mode 100644 excalibur.txt

```

<a name="creatingabranch">
#### Creating a branch
</a>

<a name="trackingbranches">
#### Tracking branches
</a>

If you would like to create a branch that is remotely tracked from the start <b>AND</b> have them share the same name, use the command `git checkout -b [branch] [remotename]/[branch]` or `git checkout --track [remotename/[branch]`
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


<a name="barerepoanditspurpose">
#### Bare repo and its purpose
</a>

Bare repos are special and can be created 
<a name="">
#### 
</a>
