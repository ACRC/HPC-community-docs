---
title: "An ssh alternative to VPN"
---

Below is an alternative way to connect to BlueCrystal or BluePebble from outside campus without the use of VPN. The specifics are for Linux but similar solutions seem to exist for Windows or Mac. We will make use of some nice features of ssh and the bastion server `seis.bris.ac.uk`. Everyone with a UoB username has access to this server, and it can be connected directly from outside.

On your local machine, create or add to the file `~/.ssh/config` the following lines:
```console
Host bp1-login.acrc.bris.ac.uk
	User [username]
	ProxyCommand ssh [username]@seis.bris.ac.uk nc bp1-login.acrc.bris.ac.uk 22

Host bc4login.acrc.bris.ac.uk
	User [username]
	ProxyCommand ssh [username]@seis.bris.ac.uk nc bc4login.acrc.bris.ac.uk 22
```

Once this is done, everything works as usual (except password is asked twice, once by `seis` and then by `bp1-login.acrc`/`bc4login.acrc`). E.g.,
```console
$ ssh [username]@bp1-login.acrc.bris.ac.uk
```
```console
$ ssh -X [username]@bp1-login.acrc.bris.ac.uk
```
```console
$ sshfs [username]@bp1-login.acrc.bris.ac.uk:/home/[username]/ ~/local_mount_point/
```
```console
$ scp [file] [username]@bp1-login.acrc.bris.ac.uk:/home/[username]
```
```console
$ rsync -[options] -e ssh [local dir]/ [username]@bp1-login.acrc.bris.ac.uk:/home/[username]/[remote dir]/
```
:::{tip} 
An alternative to ProxyCommand is ProxyJump, see e.g., [here](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts#Passing_Through_One_or_More_Gateways_Using_ProxyJump).
:::
:::{tip}
You can use ssh keys, and possibly `ssh-agent`, to avoid entering your password several times. In this case **a strong passphrase for ssh keys and a time limit on ssh-agent is strongly advised**.
:::
