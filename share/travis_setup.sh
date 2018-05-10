#!/bin/bash
set -evx

mkdir ~/.exiliumcore

# safety check
if [ ! -f ~/.exiliumcore/.exilium.conf ]; then
  cp share/exilium.conf.example ~/.exiliumcore/exilium.conf
fi
