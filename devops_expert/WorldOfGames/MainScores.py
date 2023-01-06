# run with commend : flask --app MainScores.py run
import werkzeug
from flask import Flask, render_template
from Score import read

app = Flask(__name__, template_folder='template')




@app.route('/')
def content():
    return render_template('index.html', score=read())


@app.errorhandler(werkzeug.exceptions.BadRequest)
def handle_bad_request(e):
    return render_template('err500.html')


app.register_error_handler(500, handle_bad_request)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000', debug=True)