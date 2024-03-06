#!/usr/bin/env bash

for filename in *.y*ml; do
    NAME=$(echo $filename | cut -d '.' -f 1)
    echo $NAME
    if ! limactl list --json | yq -p json '.name' -o tsv | grep $NAME; then
        set -x
        limactl create $filename --tty=false --name $NAME
        set +x
    fi
done