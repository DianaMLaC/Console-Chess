# Chess Game

A console-based chess game implemented in Ruby. Challenge yourself or a friend to a classic game of chess!

## Features

- Full chess rules implementation
- Visual board representation in the console
- Highlighting of valid moves
- Check and checkmate detection

## Getting Started:

### Prerequisites

- Ruby (version 3.0 or higher)
- Bundler (optional, for managing gems)

## Installation

1. Clone the repository:

   `git clone https://github.com/DianaMLaC/Chess.git`
   `cd chess`

2. Install the required gems:
   `gem install bundler`
   `bundle install`

## How to Play

_After cloning the repo and installing the required gems, `cd chess/lib`_

1. Start the game by running:
   `ruby chess.rb`

2. Use the arrow keys to navigate the board and press space to select a piece and its destination.

3. If the piece has valid moves, the piece will be highlighted with magenta and its moves with yellow.

4. No moves that put your king in check will be available.

5. The game will notify you if you're in check, and you must make a move to get out of check.

6. Pieces that can't get your king out of check won't be selected.

## Controls

- Arrow Keys: Move the cursor
- Space: Select/deselect a piece and confirm its move

### Running the Tests

1. Navigate to the project directory.
2. Run the tests using RSpec:
   rspec

### Adding New Tests

1. Add your test cases in the spec directory.
2. Run RSpec to see your tests pass:
   rspec

## Contributing:

Contributions are welcome! Please fork the repository and create a pull request with your changes.
