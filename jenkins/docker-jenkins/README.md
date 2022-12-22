# docker-jenkins
Command to run 
```bash
$ sudo docker-compose up -d && sudo docker-compose up -d && java -jar agent.jar -jnlpUrl http://127.0.0.1:8080/manage/computer/node1/jenkins-agent.jnlp -secret 735eccdf617dc57c2e9001acbb9c72264c3188b04999112de35f3264306ec00a -workDir "/home/shahar/jenkins"
```

To add webhook to git hub 
```bash
$ ssh -R 80:localhost:8080 localhost.run
```
and copy output URL to git hook with "github-webhook/" after
To stop
```bash
$ sudo docker-compose stop
```