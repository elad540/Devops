from devops_expert.WorldOfGames.score.Utils import scores_file_name


def add_score(diff):
    """add the points_of_winning to score"""
    try:
        cur_score = read_score()
        new_score = cur_score + ((diff * 3) + 5)
        file = open(scores_file_name, 'w')
        file.write(str(new_score))
        file.close()
    except:
        print("Something went wrong when adding the score file")


def read_score():
    """read the score"""
    try:
        file = open(scores_file_name)
        read = file.readlines()
        for line in read:
            return int(line)
        file.close()
    except:
        return "Something went wrong when opening the score file check if the file exist and the path is right in Utils.py"


