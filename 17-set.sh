#!/bin/bash

set -ex # setting the automatic exit, if we get error, set -ex for debug
failure(){
    echo "Failed at: $1:$2"
}
trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal 
echo "Hello World Sucess"
echoooo "Hello World Failure"
echo "Hello World after failure"