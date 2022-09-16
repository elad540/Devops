from Utils import scores_file_name


def add_score(diff):
    """add the points_of_winning to score"""
    cur_score = read_score()
    new_score = cur_score + ((diff * 3) + 5)
    file = open(scores_file_name, 'w')
    file.write(str(new_score))
    file.close()


def read_score():
    """read the score"""
    file = open(scores_file_name)
    read = file.readlines()
    for line in read:
        return int(line)
    file.close()
