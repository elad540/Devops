# run with commend : flask --app MainScores.py run
import werkzeug
from flask import Flask, render_template, request
from Score import read_score
import sqlite3

app = Flask(__name__, template_folder='template')


def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def content():
    conn = get_db_connection()
    # score = read_score()
    scores = conn.execute('SELECT created FROM scores').fetchall()
    conn.close()
    return render_template('index.html', score=scores)


@app.errorhandler(werkzeug.exceptions.BadRequest)
def handle_bad_request(e):
    return render_template('err500.html')


app.register_error_handler(500, handle_bad_request)
@app.route('/create', methods=['POST'])
def create():
    conn = get_db_connection()
    # Get the data from the POST request
    data = request.form.get('curr_score')
    # Insert the data into the table
    conn.execute('INSERT INTO scores (title) VALUES (sss)', (data,))
    # Save the changes to the database
    conn.commit()
    return 'Data added to the table!'

@app.route('/read', methods=['GET'])
def read():
    conn = get_db_connection()
    # Read all rows from the table
    rows = conn.execute('SELECT * FROM scores').fetchall()
    # Convert the rows to a string and return them
    return '\n'.join(str(row) for row in rows)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000', debug=True)
