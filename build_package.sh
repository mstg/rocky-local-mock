#!/bin/bash
NAME="$1"
BRANCH="$2"

if [[ -z "$NAME" ]]; then
    echo "usage: build_package.sh NAME BRANCH_NAME"
    echo "usage e.g. :  build_package.sh  nginx r8-stream-1.18"
    exit 1
fi

#if [[ -z "$BRANCH" ]]; then
#    BRANCH="r8"
#fi

cd "rpms/$NAME/$BRANCH"

rpmbuild --define "_topdir `pwd`" -v -bs "SPECS/$NAME.spec"
mock SRPMS/*
