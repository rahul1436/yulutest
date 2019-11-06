docker stop sample
docker rm sample
docker rmi test
cp Dockerfile MavenWebApp.war test/
cd test/
chmod +x Dockerfile
docker build -t test .
docker container run -d -it --name sample --publish 8081:8080 test
