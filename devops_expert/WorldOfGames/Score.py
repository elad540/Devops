from pathlib import Path
import sqlite3
scores_file_name = Path(__file__).parent / "./Scores.txt"

connection = sqlite3.connect('database.db', check_same_thread=False)

def add_score(diff):
    """add the points_of_winning to score"""
    cur_score = read()
    new_score = cur_score + ((diff * 3) + 5)
    # update the data into the table
    connection.execute(f"UPDATE scores SET score = {new_score}")
    # Save the changes to the database
    connection.commit()
    print(f"your new score is {new_score}")
    return 'Data added to the table!'



def read():
    # Read first row from the table
    rows = connection.execute('SELECT score FROM scores').fetchone()
    if rows is None:
        connection.execute('INSERT INTO scores (score) VALUES (?)', (0,))
        rows = connection.execute('SELECT score FROM scores').fetchone()
        # print(rows)
    for row in rows:
        # print(row)
        return row
