#!/bin/bash
NAME="$1"

if [[ -z "$NAME" ]]; then
    echo "usage: create_patch_repo.sh NAME"
    exit 1
fi

mkdir -p "patch/$NAME.git/ROCKY/"{CFG,_supporting}
cd "patch/$NAME.git"
git init
