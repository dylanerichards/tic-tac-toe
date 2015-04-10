class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9) { Cell.new }
  end
end
