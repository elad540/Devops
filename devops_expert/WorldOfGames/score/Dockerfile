FROM python:3.10-alpine
RUN mkdir "WorldOfGames"
WORKDIR /WorldOfGames
COPY requirements requirements
COPY . .
ENV url_score='http://172.17.0.2:5000'
RUN pip install --upgrade pip
RUN pip install -r requirements
CMD ["python", "./MainScores.py"]