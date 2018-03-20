require_relative "board"
require_relative "cell"

class TicTacToe
  attr_accessor :board, :computer, :player

  def initialize
    @board = Board.new
  end

  def choose_characters
    puts "X or O?"
    self.player = gets.chomp
    self.computer = player == "X" ? "O" : "X"
  end

  def play
    until board.winner?
      puts "Make a move: "
      board_index = Board::POSITIONS[gets.chomp]
      winner = player

      place_player_piece(player, board_index)

      unless board.winner?
        place_computer_piece
        winner = computer if board.winner?
      end

      print_board

      if board.winner?
        announce_winner(winner)
        restart_game if user_wants_to_play_again?
      else
        play
      end
    end
  end

  def start_game
    choose_characters
    play
  end

  def place_computer_piece
    board.available_cells.sample.value = computer
  end

  def place_player_piece(player, board_index)
    board.board[board_index].value = player
  end

  def print_board
    board.display
  end

  def announce_winner(winner)
    puts "#{winner} WINS!!!"
    puts "Do you want to play again?"
  end

  def user_wants_to_play_again?
    gets.chomp == "Yes"
  end

  def restart_game
    self.board = Board.new and start_game
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.start_game
