require_relative "board"
require_relative "cell"
require "pry"

def initialize_board
  @board = Board.new
end

def choose_characters
  puts "X or O?"
  @player = gets.chomp
  @computer = case @player
                        when "X" then "O"
                        when "O" then "X"
                        end
end

def start_game
  initialize_board
  choose_characters
  play
end

def play
  loop do
    puts "Make a move: "
    move = gets.chomp
    board_index = Board::POSITIONS[move]
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

    break if @board.winner?
  end
end

start_game
