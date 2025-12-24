#!/bin/sh

for v in $(docker volume ls --format "{{.Name}}")
do
  containers="$(docker ps -a --filter volume=$v --format '{{.Names}}' | tr '\n' ',')"
  echo "volume $v is used by $containers"
done

