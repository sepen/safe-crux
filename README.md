
# README

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
  use      Use existing environment
  version  Print version information
  help     Print help and usage information

Run 'safe-crux COMMAND -h' or 'safe-crux help COMMAND' for info on a command
```


## Developers

### Create new commands

To create a new command for safe-crux. For example 'helloworld' these are the steps:

* Create a new file (lib/helloworld) with at least some required functions:
```
#!/usr/bin/env bash

scxHelloHelp() {
  cat << __EOF__
Usage: $SCX_APPNAME helloworld
__EOF__
  exit 0
}

scxHello() {
  # do whatever the command does, for example: echo 'helloworld'
  echo 'helloworld'
  exit 0
}
```

* Then you should update scxHelp function in main library (lib/scx):
```
--- a/lib/scx
+++ b/lib/scx
@@ -23,6 +23,7 @@ Commands:
   status      Print status of running environments
   use         Use existing environment
   version     Print version information
+  helloworld  Print helloworld message
   help        Print help and usage information
 
 Run '$SCX_APPNAME COMMAND -h' or '$SCX_APPNAME help COMMAND' for info on a command
```

* In addition it would be good that you create a pull request or send that patch to me


### Functions

Functions starting with 'scx' prefix are reserved for commands and should not be used in other functions.  
Shared functions are defined in the main library (lib/scx). Here is a list of functions that can be used:
* getTarget
* getTargetType
* getMountDir
