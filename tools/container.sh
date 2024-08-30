CONTAINER_NAME="web"
if [ "$( docker container inspect -f '{{.State.Running}}' $CONTAINER_NAME )" = "true" ]; then
    docker exec -it $CONTAINER_NAME bash
else
    echo "$CONTAINER_NAME is not running"
fi