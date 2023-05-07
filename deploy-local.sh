DOCKER_COMPOSE_FILE="docker-compose.prod.yml"
REMOTE_HOST="zaiquiriw.net"
REMOTE_USER="zaiq"
REMOTE_DIR="/home/zaiq/port-zaiq/"
IMAGES=$(docker compose -f docker-compose.prod.yml config --images)

# Build and save the Docker images
docker compose -f $DOCKER_COMPOSE_FILE build
echo "The results of the Build"
echo $IMAGES
docker save $IMAGES | gzip > images.tar.gz

# Transfer the images to the remote host
scp images.tar.gz $REMOTE_USER@$REMOTE_HOST:"${REMOTE_DIR}images.tar.gz"

# Load the images on the remote host and start the containers
ssh $REMOTE_USER@$REMOTE_HOST "cd $REMOTE_DIR && sh deploy-server.sh"

rm images.tar.gz