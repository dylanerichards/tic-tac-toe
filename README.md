# Tic Tac Toe

## How to Play

Clone the repository and change into the project's directory.

Run `ruby tic_tac_toe.rb`.

You'll be prompted to choose a character. Your choice must be an `X` or an 	`O`.

From here, you will be prompted to make a move. Here are your options:

- `top left`
- `top middle`
- `top right`
- `middle left`
- `center`
- `middle right`
- `bottom left`
- `bottom middle`
- `bottom right`

After you make a move, the computer will respond with one of its own, and the process repeats until there is a winner.

When asked for another game, reply `Yes` to do so. Typing anything else will exit the game.

## How the Winning Logic is Implemented

The `Board` is represented as an `Array` with 9 openings (8 indexes). Each of these openings contains a `Cell`. There is an attribute on `Cell` instances called `value` that stores either an X or an O.

The board, with its `WINNING_COMBINATIONS` constant is also aware of which indexes need to be filled in order for there to be a potential winner.

The sauce is in `#winner?`, where we iterate over each combination in `WINNING_COMBINATIONS`, and check to see if each of those indexes contain the same value.

There is also a check to see if one of those indexes is a `String` so that the board doesn't interpret three consecutive `:blank` cells as there being a winner.




