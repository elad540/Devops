FROM python:3.10-alpine
RUN mkdir "WorldOfGames"
WORKDIR /WorldOfGames
COPY requirements requirements
#COPY score/MainScores.py score/MainScores.py
RUN pip install --upgrade pip
RUN pip install -r requirements
ENV FLASK_APP=score/MainScores.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 8777
CMD ["flask", "run", "-h", "172.19.0.2"]