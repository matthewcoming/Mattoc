## Install Elastic Beanstalk cli

```bash
$ pwd
/home/matt/
$ pip install --upgraded pip
//get pip up to date
$ pip install awsebcli --upgrade --user
// install eb-cli
```
Depending on your version of python and whether or not you do this in a conda v-env, the `eb` binary will bin somewhere in your python binaries.

Mine happened to be in `~/.local/lib/python3.6/site-packages`

Add `export PATH=~/.local/lib/python3.6/site-packages` to your .profile, .bash_profile, or .bash_login

```bash
$ source ~/.profile
$ eb --version
EB CLI 3.7.8 (Python )
```

