# docker-jenkins
command to run :
"cd /home/shahar/Desktop/Devops/docker-jenkins && sudo docker-compose up -d && java -jar agent.jar -jnlpUrl http://127.0.0.1:8080/manage/computer/node1/jenkins-agent.jnlp -secret 735eccdf617dc57c2e9001acbb9c72264c3188b04999112de35f3264306ec00a -workDir "/home/shahar/jenkins""
on different terminal run "ssh -R 80:localhost:8080 localhost.run"
and copy output URL to git hook with "github-webhook/" after
to stop :
"sudo docker-compose stop" 


