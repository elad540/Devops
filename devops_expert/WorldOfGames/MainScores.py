# run with commend : flask --app MainScores.py run
from flask import Flask, render_template
from Score import read_score


app = Flask(__name__, template_folder='template')


@app.route('/')
def content():
    if type(read_score()) != int:
        score = ""
        error = read_score()
    else:
        score = f"The score is {read_score()}"
        error = ""
    return render_template('index.html', score=score, error=error)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='8000')
