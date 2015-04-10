require_relative "board"
require_relative "cell"
require "pry"

def initialize_board
  @board = Board.new
end

def choose_characters
  puts "X or O?"
  @player_character = gets.chomp
  @computer_character = case @player_character
                        when "X" then "O"
                        when "O" then "X"
                        end
end

def play
  loop do
    puts "Make a move: "
    move = gets.chomp
    board_index = Board::POSITIONS[move]
    winner = @player_character

    @board.board[board_index].value = @player_character

    if !@board.winner?
      @board.available_cells.sample.value = @computer_character
      winner = @computer_character if @board.winner?
    end

    if @board.winner?
      p "#{winner.upcase} WINS!!!"
      @board.to_representation
      puts "Do you want to play again?"
      answer = gets.chomp

      if answer == "Yes"
        initialize_board
        choose_characters
        play
      end
    else
      @board.to_representation
      play
    end

    break if @board.winner?
  end
end

initialize_board
choose_characters
play
