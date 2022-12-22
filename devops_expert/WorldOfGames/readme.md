# world of games
in this project you can play Currency Roulette Game, Guess game and Memory game.
you can do it by running 
```bash
$ python MainGame.py
```
To see your score run 
```bash
$ docker run --name score-flsk shaharco1804/score_flask  
```
and copy the input URL to your browser 


### HELM FOR JENKINS
```bash
$ helm install jenkins jenkins/jenkins -f values.yaml --namespace=jenkins
```
After build crate a pipline and connect it to this git repo,
and run the jenkinsfile attached to build run and check the score_flask image 