CONTAINER_NAME="mariadb"
if [ "$( docker container inspect -f '{{.State.Running}}' $CONTAINER_NAME )" = "true" ]; then
    docker exec -it $CONTAINER_NAME mariadb -u root -proot
else
    echo "$CONTAINER_NAME is not running"
fi