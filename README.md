
# safe-crux


## What is safe-crux?

`safe-crux` (aka `scx`) IS NOT another system containers solution like [LxC](https://linuxcontainers.org)
and [Docker](https://www.docker.com). This is only focused on [CRUX Linux](https://crux.nu) and keeping in mind the KISS principle.

The goal is to provide an easy way to install CRUX Linux or upgrade an existing installation without
the need to use a bootable medium for it.

It is also a good way for those unfamiliar with CRUX to try it out and customize their own installation.


## Demo

Install CRUX 3.5 (x86_64 Updated ISO) on a secondary partition

![scx demo - Install CRUX 3.5 on a secondary partition](demo/setup-on-a-secondary-partition.gif)

## Getting started

Installation from git:

```console
git clone https://github.com/sepen/safe-crux
sudo ./install.sh
```

You can alternatively install it inside your user directory. This option is recommended for most people:
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
