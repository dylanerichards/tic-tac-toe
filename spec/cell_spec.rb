require "spec_helper"
require_relative "../cell.rb"

describe Cell do
  let(:cell) { Cell.new }

  it "has a value that defaults to blank" do
    expect(cell.value).to eq :blank
  end

end

