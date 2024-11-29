multi-module-management> docker-compose up -- build   
BUILDING DOES-NOT WORK
docker pull mysql:9.1.0

Compile and package jar scanner-0.0.1-SNAPSHOT.jar and aero-0.0.1-SNAPSHOT.jar
AND build images as below. Make sure Docker desktop is running
3) webstn> docker build -f Dockerfile -t igr025/webstn-17-img:v0.1 .
4) scanner> docker build -f Dockerfile -t igr025/scanner-17-img:v0.1 .
5) jdbc:h2:mem:h2_db       ----database connection
Create queue on active MQ broker:  scanner.queue
scanner will write messages to it.

SCANNER entry point: http://localhost:81/scanner/message/new
STATION entry point: https://localhost/aero/received-messages
deploy compose file to azure : ->
https://www.youtube.com/watch?v=jC23hgGkdIM
azure container apps