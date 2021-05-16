# sds_ver_auto
Automatic version of sds_ver. Checks ds of every started executable not belonging to root.  
It preloads execv syscall for gnome-terminal copy. To change ternimal replace gnome-terminal with yours in sds_ver executable file.

[DS generator](https://github.com/mitchon/sds_gen)  
[DS verifier](https://github.com/mitchon/sds_ver) (non-automatic one)  

Tested in Ubuntu 20.04 LTS

## Installation
<code>make</code>  
<code>make install</code>

## Uninstall
<code>make uninstall</code>

## Start
To start a program use <code>sds_ver\_auto</code>. This executable is stored in `/usr/local/bin`. Executing it opens a terminal copy.

## Configuration files
Configs are in `/usr/local/etc/sds_ver`  
ds_params contains digital signature parameters  
public_accounts contains user login and his public keys  
