[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

# Usage

```bash
./run.sh [options] [arguments ...]
```

## Options

|Option|Default|Argument|
|--|--|--|
|`-a`|a temporary file|File to dump generated MIPS code|
|`-c`|`"racket wlp4gen.rkt"`|Command to run the compiler|
|`-m`|`mips.twoints`|MIPS command to run on the server|

## Arguments

Names of the `.merl` files to link with generated code before running.

By default, this is none.

# Setup

This testing script uses multiple scripts, one local and two on the server. The script makes several round trips to the linux server. This might be a problem if you don't have passwordless :lock: login setup. It's something that would definitely make your life easier even if you don't use these testing scripts. [This](https://www.thegeekdiary.com/centos-rhel-how-to-setup-passwordless-ssh-login/) might be a good resource to set it up.

## Local

- Go to your assignment folder and get the main script
- Make sure to edit your quest username in `run.sh`

```bash
$ wget https://raw.githubusercontent.com/9at8/cs241-test/master/run.sh
$ vim ./run.sh
$ chmod u+x ./run.sh
```

## Linux server

- SSH into the server `cd` into the home directory
- Get the two helper scripts for the server and make them executable
- Put `print.merl` from the course website in the home directory
- Put other merl files in the home directory as well (if you're using them)


```bash
$ ssh QuestUsername@linux.student.cs.uwaterloo.ca
$ cd ~
$ wget https://raw.githubusercontent.com/9at8/cs241-test/master/run.mips.sh
$ wget https://raw.githubusercontent.com/9at8/cs241-test/master/run.wlp4i.sh
$ chmod u+x ./run.mips.sh ./run.wlp4i.sh
$ wget https://www.student.cs.uwaterloo.ca/~cs241/a8/lib/print.merl
```

## Examples

### Basic

Assuming script is in the same directory as the project, and we don't want to link anything.

```bash
# racket
$ ./run

# C++
$ ./run -c "make; ./wlp4gen"
```

### Custom location

Assuming script is in some other directory than the project, and we don't want to link anything.

```bash
# racket
$ ./run -c "racket /home/adi/CS241/assignments/a8/wlp4gen.rkt"

# C++
$ ./run -c "cd /home/adi/CS241/assignments/a8/wlp4gen.rkt; make; ./wlp4gen"
```

### Dump generated code for debugging

Assuming script is in the same directory as the project, and we don't want to link anything.

```bash
# racket
$ ./run -a mips.asm

# C++
$ ./run -c "make; ./wlp4gen" -a mips.asm
```

### Run some other command for MIPS code

Assuming script is in the same directory as the project, and we don't want to link anything.

```bash
# racket
$ ./run -m "someOtherCommandInsteadOf_mips.twoints"

# C++
$ ./run -c "make; ./wlp4gen" -m "someOtherCommandInsteadOf_mips.twoints"
```

### Linking single or multiple `.merl` files

Assuming script is in the same directory as the project.

:bulb: Make sure that the `.merl` files that you're linking already exist in the home directory on the server

:bulb: These **always** go in the end, without an option

```bash
# racket
$ ./run print.merl alloc.merl something_else.merl

# C++
$ ./run -c "make; ./wlp4gen" print.merl alloc.merl something_else.merl
```
