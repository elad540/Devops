from currency_converter import CurrencyConverter
from random import randrange
from devops_expert.WorldOfGames.games.Live import valid_num
from devops_expert.WorldOfGames.score.Score import add_score


def get_money_interval(diff):
    """This function calculate minimum and maximum of possible answer"""
    interval = 6 - diff
    return interval


def get_guess_from_user(amount):
    """This function get the user answer"""
    guess = valid_num(1, 1000, input(f"Enter how much you think {amount} in USD worth in ILS: "))
    return int(guess)


def play(diff):
    """This function plays the game CurrencyRouletteGame"""
    amount = randrange(1, 100)
    interval = get_money_interval(diff)
    c = CurrencyConverter()
    total = round(c.convert(amount, 'USD', 'ILS'), 2)
    maximum = total + interval
    minimum = total - interval
    # # for tests
    # print(total)
    guess = get_guess_from_user(amount)
    if minimum < guess < maximum:
        print(f"you won, you were close enough the answer is {total} ")
        add_score(diff)
    else:
        print(f"you lost the answer is {total},you were this far from the answer {total - guess}")

