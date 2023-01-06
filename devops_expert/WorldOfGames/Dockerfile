FROM python:3.10-alpine
RUN mkdir "WorldOfGames"
WORKDIR devops_expert/WorldOfGames
COPY requirements requirements
RUN pip install --upgrade pip
RUN pip install -r requirements
COPY . .
CMD ["python", "MainScores.py"]