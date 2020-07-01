#!/bin/bash

if [ -z $1 ]; then
  echo ""
  echo "Plugin develop by Steodec"
  echo "Version 1.0"
  echo ""
  echo "Example usage:"
  echo "  gitbashCI commit : Push with message in actual branch"
  echo "  gitbashCI tag : Push with message in specifique tag"
  echo "  gitbashCI init : Create repo git"
  echo ""
  exit 0
fi

PATH_SCRIPT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

if [[ $1 == "init" ]]; then
  $PATH_SCRIPT/init.sh
fi
if [[ $1 == "tag" ]]; then
  $PATH_SCRIPT/tag.sh
fi
if [[ $1 == "commit" ]]; then
  $PATH_SCRIPT/commit.sh
fi
