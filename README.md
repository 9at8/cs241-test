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
