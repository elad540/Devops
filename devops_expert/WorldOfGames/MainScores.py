# run with commend : flask --app MainScores.py run
from flask import Flask, render_template
from Score import read_score
from Utils import bad_return_code


app = Flask(__name__, template_folder='template')


@app.route('/')
def content():
    return render_template('index.html', score=read_score(), error=bad_return_code)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='8000')
