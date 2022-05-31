#!/bin/bash
docker ps | awk '{print $1}' > /tmp/containerID
while IFS= read -r line; do
        if [[ $(docker inspect --format='{{.HostConfig.Privileged}}' $line) == "false" ]]; then
                    echo not privileged
        else
                    echo "privileged $line"
fi
done < /tmp/containerID
