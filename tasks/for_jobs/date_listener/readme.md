# date listener 
To create the docker image run this command in current directory
```bash
$ docker build -t date .
```
after image is created run
```bash
$ docker run -p 8080:8080 --rm date
```