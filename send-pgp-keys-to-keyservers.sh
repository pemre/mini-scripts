#!/bin/bash
#
# Author:      Emre Piskin
# E-mail:      piskin.emre@gmail.com
# Vers:        1.0.0
# Description: Script to send multiple PGP keys to keyservers at once
#

declare -a aKeys=(ABCDEF0123456789 2BCDEF0123456789 3BCDEF0123456789);
declare -a aServers=('keyserver.ubuntu.com' 'pgp.key-server.io' 'pgp.mit.edu' 'keys.gnupg.net');
for sServer in "${aServers[@]}";do
    gpg --keyserver "${sServer}" --send-keys ${aKeys[*]};
done
