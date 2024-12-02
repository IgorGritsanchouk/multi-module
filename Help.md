multi-module-management> docker-compose up -- build   
BUILDING DOES-NOT WORK
docker pull mysql:9.1.0

1) run apache/activemq-classic:latest   image
docker run -d --name activemq-classic-cnr -p 61616:61616 -p 8161:8161 apache/activemq-classic:5.18.6
2) access  http://127.0.0.1:8161/admin/      console and create new queue :
   create scanner.queue   -  new queue

3)  If using mysql database !!!  instead og h2  db
-- starting mysql db as mysql-lera-container
docker run -d --name mysql-aero-cnr -p 3306:3306 -e MYSQL_ROOT_PASSWORD=lera -e MYSQL_DATABASE=aero mysql:lts
docker run -d --name mysql-aero-cnr -p 3306:3306 -v C:/Users/igorg/Desktop/Projects/lera/db:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=lera -e MYSQL_DATABASE=aero mysql:lts



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