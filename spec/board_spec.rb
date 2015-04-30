require "spec_helper"
require "pry"
require_relative "../board.rb"
require_relative "../cell.rb"

describe Board do
  let(:board) { Board.new }
  let(:cell) { Cell.new(value: "X") }

  it "is represesented as an 8-index array" do
    expect(board.board.size).to eq 9
  end

  it "is filled with cells" do
    board.board.each { |cell| expect(cell).to be_a Cell }
  end

  it "contains the winning combinations" do
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].each do |combination|
      expect(Board::WINNING_COMBINATIONS).to include combination
    end
  end

  describe "#winner?" do
    it "knows when there is a winner" do
      board.board[2], board.board[4], board.board[6] = Array.new(3, cell)

      expect(board.winner?).to eq true
    end

    it "returns false when there is no winner" do
      fill_board

      expect(board.winner?).to eq false
    end

    describe "#available_cells" do
      before(:each) do
        fill_board
      end

      it "returns an array whose size is equal to 9 - the amount of occupied cells" do
        expect(board.available_cells.size).to eq 6
      end

      it "returns all blank cells on the board" do
        unblank_cells = board.board.reject { |cell| cell.value == :blank }
        blank_cells = board.board - unblank_cells

        expect(board.available_cells).to eq blank_cells
      end
    end
  end

  private

  def fill_board
    board.board[2], board.board[4], board.board[3] = Array.new(3, cell)
  end
end
