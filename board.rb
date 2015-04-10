class Board
  attr_accessor :board

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9) { Cell.new }
  end

  def winner?
    WINNING_COMBINATIONS.each do |combination|
      if board[combination[0]].value == board[combination[1]].value && board[combination[1]].value == board[combination[2]].value && board[combination[0]].value.is_a?(String)
        p "OMG"
      end
    end
  end
end
