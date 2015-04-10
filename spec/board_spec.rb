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
end
