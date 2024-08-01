#!/bin/bash

NUM_NODES=3

cleanup() {
    echo "Exiting..."
    exit 0
}

trap cleanup SIGINT

for ((i=15; i>=0; i-=5)); do
    echo "Chaos starting in $i seconds..."
    sleep 5
done

while true; do
    all_200=true
    for ((node=1; node<=$NUM_NODES; node++)); do
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "http://patroni$node:8008/readiness")
        if [[ $status_code -ne 200 ]]; then
            all_200=false
            break
        fi
    done

    if [[ $all_200 == false ]]; then
        echo "Patroni cluster is not ready for switchover, sleeping"
        sleep 5
        continue
    fi

    LEADER=$(curl -s -X GET "http://patroni1:8008/cluster" | jq -r '.members[] | select(.role == "leader") | .name')
    echo "Switchover from $LEADER"
    curl -s -X POST "http://$LEADER:8008/switchover" \
        -d "{\"leader\":\"$LEADER\",\"force\": true}"
    echo ""
    sleep 5
done