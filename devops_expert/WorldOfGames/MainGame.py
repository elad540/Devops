import Live
import GuessGame
import MemoryGame
import CurrencyRouletteGame

name = input("What is your name: ")
Live.welcome(name)
game = int(Live.load_game())
diff = int(Live.difficulty())
if int(game) == 1:
    MemoryGame.play(diff)
elif int(game) == 2:
    GuessGame.play(diff)
#      int(game) == 3
else:
    CurrencyRouletteGame.play(diff)
