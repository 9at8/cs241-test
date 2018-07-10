# Usage

```bash
./run.sh "<the way to run your compiled code>" "<merl files to use>" "<mips command to run>"

# Example

./run.sh "racket wlp4gen.rkt" "print.merl" "mips.twoints"
```

# Setup

Make sure you have `./run.wlp4i.sh` and `./run.mips.sh` in the home directory the linux server. And make sure that you give executable permissions to these scripts on the server usin `chmod u+x ~/run.*.sh`

You would also need to change your quest username in the `./run.sh` file

Note that this works best when you have passwordless login to the ssh server. You probably want to do [this](https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/) or something similar if you want to avoid typing your password 4 times :stuck_out_tongue:


# Setup

This testing script uses multiple scripts, one local and two on the server. The script makes several round trips to the linux server. This might be a problem if you don't have passwordless :lock: login setup. It's something that would definitely make your life easier even if you don't use these testing scripts.

## Local setup

- Go to your assignment folder and get the main script using this:

```bash
$ wget https://raw.githubusercontent.com/9at8/cs241-test/master/run.sh
$ chmod u+x ./run.sh
```

## Linux server setup

- SSH into the server `cd` into the home directory
- Get the two helper scripts for the server and make them executable


```bash
$ ssh QuestUsername@linux.student.cs.uwaterloo.ca
$ cd ~
$ wget https://raw.githubusercontent.com/9at8/cs241-test/master/run.mips.sh
$ wget https://raw.githubusercontent.com/9at8/cs241-test/master/run.wlp4i.sh
$ chmod u+x ./run.mips.sh ./run.wlp4i.sh
```
