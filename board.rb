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

  POSITIONS = {
    "top left" => 0,
    "top middle" => 1,
    "top right" => 2,
    "middle left" => 3,
    "center" => 4,
    "middle right" => 5,
    "bottom left" => 6,
    "bottom middle" => 7,
    "bottom right" => 8
  }

  def initialize
    @board = Array.new(9) { Cell.new }
  end

  def winner?
    winner = false
    WINNING_COMBINATIONS.each do |combination|
      if board[combination[0]].value == board[combination[1]].value && board[combination[1]].value == board[combination[2]].value && board[combination[0]].value.is_a?(String)
        winner = true
      end
    end
    winner
  end

  def available_cells
    board.select { |cell| cell.value == :blank }
  end

  def to_s
    rows = board.each_slice(3).to_a

    rows.each do |row|
      p row.map(&:value)
    end
  end
end
