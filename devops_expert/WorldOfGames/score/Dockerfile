FROM python:3.10
RUN mkdir "WorldOfGames"
WORKDIR /WorldOfGames
COPY requirements requirements
COPY . .
ENV url_score='http://172.17.0.2:5000'
RUN python3 -m venv flask-env
RUN chmod +x flask-env/bin/activate
RUN . flask-env/bin/activate && pip install --upgrade pip && pip install -r requirements
CMD ["python", "./MainScores.py"]