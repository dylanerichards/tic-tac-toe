class Cell
  attr_accessor :value

  def initialize(value: :blank)
    @value = value
  end

  def blank
    value == :blank
  end
end
