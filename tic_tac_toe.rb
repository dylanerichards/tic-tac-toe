require_relative "board"
require_relative "cell"

def initialize_board
  @board = Board.new
end

def choose_characters
  puts "X or O?"
  @player = gets.chomp
  @computer = case @player
              when "X" then "O"
              when "O" then "X"
              else
                "C"
              end
end

def start_game
  initialize_board
  choose_characters
  play
end

def play
  until @board.winner?
    puts "Make a move: "
    board_index = Board::POSITIONS[gets.chomp]
    winner = @player

    @board.board[board_index].value = @player

    if !@board.winner?
      @board.available_cells.sample.value = @computer
      winner = @computer if @board.winner?
    end

    if @board.winner?
      p "#{winner.upcase} WINS!!!"
      @board.display
      puts "Do you want to play again?"

      start_game if gets.chomp == "Yes"
    else
      @board.display
      play
    end
  end
end

start_game
