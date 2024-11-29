multi-module-management> docker-compose up -- build   
BUILDING DOES-NOT WORK
docker pull mysql:9.1.0
docker pull mysql:9.1.0

Compile and package jar scanner-0.0.1-SNAPSHOT.jar and aero-0.0.1-SNAPSHOT.jar
AND build images as below. Make sure Docker desktop is running
3) aero> docker build -f Dockerfile -t aero-17-img:v0.1 .
4) scanner> docker build -f Dockerfile -t scanner-17-img:v0.1 .

deploy compose file to azure : ->
https://www.youtube.com/watch?v=jC23hgGkdIM
azure container apps