#!/bin/bash
NAME="$1"
BRANCH="$2"

if [[ -z "$NAME" ]]; then
    echo "usage: import_package.sh NAME"
    exit 1
fi
if [[ -z "$BRANCH" ]]; then
    BRANCH="r8"
fi

if [[ -d "patch/$NAME.git" ]]; then
    cd "patch/$NAME.git"
    git add . || true
    git commit -m "update" || true
    cd ../..
fi

cd "rpms/$NAME/$BRANCH"

rpmbuild --define "_topdir `pwd`" -v -bs SPECS/abrt.spec
mock SRPMS/*
