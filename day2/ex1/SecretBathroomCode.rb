class SecretBathroomCode

  def find_next_step from, directions_string
    directions = directions_string.each_char.to_a
    value = from.to_s.to_i(16)

    directions.each do |char|
      if char == 'R'
        value += 1 if not [1, 4, 9, 'C'.to_i(16), 'D'.to_i(16)].include? value
      elsif char == 'L'
        value -= 1 if not [1, 2, 5, 'A'.to_i(16), 'D'.to_i(16)].include? value
      elsif char == 'U'
        if not [1, 2, 4, 5, 9].include? value
          if [3, 'D'.to_i(16)].include? value
            value -= 2
          else
            value -= 4
          end
        end
      elsif char == 'D'
        if [1, 'B'.to_i(16)].include? value
          value += 2
        else
          value += 4 if not ['A'.to_i(16), 'C'.to_i(16), 'D'.to_i(16), 5, 9].include? value
        end
      end
    end

      value.to_s(16).upcase
  end

  def solve lines
    position = 5
    code = []

    lines.each do |line|
      position = find_next_step position, line
      code.push(position)
    end

    code.join('')
  end

end
