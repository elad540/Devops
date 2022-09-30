from devops_expert.WorldOfGames.score.Utils import scores_file_name


def add_score(diff):
    """add the points_of_winning to score"""
    try:
        cur_score = read_score()
        new_score = cur_score + ((diff * 3) + 5)
        file = open(scores_file_name, 'w')
        file.write(str(new_score))
        print(f"your new score is {new_score}")
        file.close()
    except FileNotFoundError:
        print("Something went wrong when adding the score file please check the file path in Utils.py")


def read_score():
    """read the score"""
    try:
        file = open(scores_file_name)
        read = file.readlines()
        for line in read:
            return int(line)
        file.close()
    except FileNotFoundError:
        print("Something went wrong when opening the score file check if it exists and the path is right in Utils.py")

