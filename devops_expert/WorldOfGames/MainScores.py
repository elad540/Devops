# run with commend : flask --app MainScores.py run
from flask import Flask, render_template
from Score import read_score
import Utils


app = Flask(__name__, template_folder='template')


@app.route('/')
def content():
    return render_template('index.html', score=read_score(), error=Utils.bad_return_code)
