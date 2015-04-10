class Cell
  attr_accessor :value

  def initialize(options = {})
    @value = options.fetch(:value, :blank)
  end
end
