#!/bin/sh

buildDir=./rom
subProj="rb2ini-4 rb2ini-b"

# Get absolute path of build script
SCRIPT_PATH="$(cd $(dirname $0); pwd -P)"

# Delete $buildDir, see build target 'clean'
doClean() {
  echo "clean"
  rm -rf $buildDir
  return 0
}

# Build project, see build target 'build'
doBuild() {
    mkdir -p $buildDir
    for proj in $subProj; do
        pushd $proj
        ./build.sh build
        popd
        cp $proj/build/$proj.rom ./$buildDir/$proj.rom
    done
}

if  [ "$1" == "clean" ]; then
    doClean
    exit $?
elif [ "$1" == "" ] || [ "$1" == "build" ]; then
    doBuild
    exit $?
else
    echo "*** error: unknown build target"
    exit 1
fi
