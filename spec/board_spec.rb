require "spec_helper"
require "pry"
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


  describe "#winner?" do
    it "knows when there is a winner" do
      cell1 = Cell.new(value: "X")
      cell2 = Cell.new(value: "X")
      cell3 = Cell.new(value: "X")

      board.board[2] = cell1
      board.board[4] = cell2
      board.board[6] = cell3

      expect(board.winner?).to eq true
    end

    it "returns false when there is no winner" do
      cell1 = Cell.new(value: "X")
      cell2 = Cell.new(value: "X")
      cell3 = Cell.new(value: "X")

      board.board[2] = cell1
      board.board[4] = cell2
      board.board[3] = cell3

      expect(board.winner?).to eq false
    end

    describe "#available_cells" do
      it "returns all blank cells on the board" do
        cell = Cell.new(value: "X")
        board.board[2], board.board[4], board.board[3] = Array.new(3, cell)

        unblank_cells = board.board.reject { |cell| cell.value == :blank }
        blank_cells = board.board - unblank_cells

        expect(board.available_cells).to eq blank_cells
      end
    end
  end
end
