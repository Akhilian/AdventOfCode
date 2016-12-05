class BathroomCode

  def find_next_step from, directions_string
    directions = directions_string.each_char.to_a
    value = from

    directions.each do |char|
      if char == 'L'
        value -= 1 if value % 3 != 1
      elsif char == 'R'
        value += 1 if value % 3 != 0
      elsif char == 'U'
        value -= 3 if value - 3 > 0
      elsif char == 'D'
        value += 3 if value + 3 <= 9
      end
    end

    value
  end

  def find_code lines
    position = 5
    code = []

    lines.each do |line|
      position = find_next_step position, line
      code.push(position)
    end

    code.join('').to_i
  end

end
