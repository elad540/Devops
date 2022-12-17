FROM python:3.10-alpine
RUN mkdir "WorldOfGames"
WORKDIR /WorldOfGames
COPY requirements requirements
COPY . .
RUN pip install --upgrade pip
RUN pip install -r requirements
CMD ["python", "./MainScores.py"]