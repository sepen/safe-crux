
# SCX - Safe CRUX


## What is Safe CRUX?

`Safe CRUX` IS NOT another system containers solution like [LxC](https://linuxcontainers.org)
and [Docker](https://www.docker.com). This is focused on [CRUX Linux distribution](https://crux.nu) and keeping in mind the KISS principle.

The goal is to provide an easy way to install CRUX or upgrade an existing installation without
the need to use a bootable medium for it.
`Safe CRUX` can work directly with partitions, mount points, directories and image files.

`Safe CRUX` is also a way to test CRUX within another Linux distribution in an easy and fast way.

## Demo

![scx demo - Install CRUX 3.5 on a secondary partition](demo/setup-on-a-secondary-partition.gif)

## Getting started

Install from git repository:

```console
git clone https://github.com/sepen/safe-crux
sudo ./install.sh
```

You can also install it on your user's home:
```console
PREFIX="$HOME/.safe-crux" ./install.sh
export PATH=$PATH:$HOME/.safe-crux/bin
```

## Usage

```
Usage: safe-crux [option(s)] COMMAND [argument(s)]

Options:

  -c FILE  Location of config file
  -h       Print usage and quit
  -V       Print version information and quit
  -e       Print environment variables and quit

Commands:

  env      Print environment variables
  setup    Run setup to install or update an enviroment
  status   Print status of running environments
  run      Run existing environment
  version  Print version information
  help     Print help and usage information

Run 'safe-crux COMMAND -h' or 'safe-crux help COMMAND' for info on a command
```


## Use cases

### Keep my CRUX partition at office while I work on Ubuntu

For reasons of my work, my laptop has Ubuntu installed. I also have CRUX installed, but in most cases I can not restart the laptop to start CRUX
and then restart it for Ubuntu and continue working, so most of the time I remain in Ubuntu.
As in my setup, CRUX resides in a disk partition, with `Safe CRUX` I can continue updating packages to my system without having to restart.

Every day I usually do the following actions to keep my partition (/dev/sda6) with CRUX updated:

```console
scx run /dev/sda6 "ports -u"
scx run /dev/sda6 "prt-get sysup"
```

With this I make sure that the next time I start CRUX I will have fewer packages to compile.


## Contribute to development

### Create a new command: scx hello

First create the main file (lib/hello) and put on it two mandatory functions:
`scxHello` and `scxHelloHelp` which are required to call the new command and show
a help message. You should use lowerCamelCase for naming convention.

```bash
#!/usr/bin/env bash

scxHelloHelp() {
  echo "$SCX_APPNAME hello"

scxHello() {
  echo 'hello'
}
```

Then register your function into the main SCX library (lib/scx):

```diff
--- a/lib/scx
+++ b/lib/scx
@@ -23,6 +23,7 @@ Commands:
   status      Print status of running environments
   run         Run existing environment
   version     Print version information
+  hello       Print hello message
   help        Print help and usage information
 
 Run '$SCX_APPNAME COMMAND -h' or '$SCX_APPNAME help COMMAND' for info on a command
```

You can add more functions by keeping the same prefix scxHello:

```bash
scxHelloFoo() {
  echo 'hello foo'
}

scxHelloFooTwoTimes() {
  scxHelloFoo
  scxHelloFoo
}
```


### Environment variables

You can use these variables from the code. To get a list:

```console
scx env
```


### Shared functions

Shared functions are defined in the main library (lib/scx). Here is a list of
functions that can be used:
* getTarget
* getTargetType
* getMountDir
