docker rm $(docker stop $(docker ps -a -q --filter="name=trivia.api.gateway.main" --format="{{.ID}}"))
docker run -d -p 7000:80 --network="bridge" --restart=always --name trivia.api.gateway.main trivia.api.gateway.main:latest
exit 0