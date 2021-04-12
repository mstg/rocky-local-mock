#!/bin/bash
NAME="$1"

if [[ -z "$NAME" ]]; then
    echo "usage: import_package.sh NAME"
    exit 1
fi

mkdir -p "rpms/$NAME"
mkdir -p /tmp/srpmproc-dist
srpmproc --version 8 --upstream-prefix "file://$(pwd)" --storage-addr file:///tmp/srpmproc-dist --source-rpm "$NAME" --tmpfs-mode "rpms/$NAME"
