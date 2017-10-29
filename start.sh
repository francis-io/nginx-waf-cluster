docker build -t app app
docker build -t waf waf

docker swarm init
docker stack deploy --compose-file=docker-compose.yml demo
