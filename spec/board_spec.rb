require "spec_helper"
require_relative "../board.rb"
require_relative "../cell.rb"

describe Board do
  let(:board) { Board.new }

  it "is represesented as an 8-index array" do
    expect(board.board.size).to eq 9
  end

  it "is filled with cells" do
    board.board.each do |cell|
      expect(cell).to be_a Cell
    end
  end

  it "contains the winning combinations" do
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].each do |combination|
      expect(Board::WINNING_COMBINATIONS.include?(combination)).to eq true
    end
  end

  it "knows when there is a winner" do
    cell1 = Cell.new(value: "X")
    cell2 = Cell.new(value: "X")
    cell3 = Cell.new(value: "X")

    board.board[2] = cell1
    board.board[4] = cell2
    board.board[6] = cell3

    p board.winner?
    # expect(board.winner?).to eq true
  end
end
