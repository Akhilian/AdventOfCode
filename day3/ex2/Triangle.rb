class Triangle

  attr_reader :sides

  def initialize sides = []
    @sides = sides
  end

  def valid?
    @sides
      .combination(2)
      .to_a
      .map { |couple| couple[0].to_i + couple[1].to_i > (@sides - couple)[0].to_i }
      .all?
  end

  def == another_triangle
    self.sides == another_triangle.sides
  end
end
