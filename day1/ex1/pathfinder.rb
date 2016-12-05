class PathFinder
  def get_distance coordinates
    (coordinates[0]).abs + (coordinates[1]).abs
  end

  def get_new_orientation from, to
    coordinates = [:north, :east, :south, :west]
    coordIndex = coordinates.index(from)

    if /L/.match(to)
      coordIndex = coordIndex - 1
      return coordinates[coordIndex]
    else
      coordIndex = coordIndex + 1 > 3 ? 0 : coordIndex + 1
      return coordinates[coordIndex]
    end
  end

  def get_coordinates coordinates
    crossed_coordinates = get_crossed_coordinates coordinates
    crossed_coordinates[-1]
  end

  def get_crossed_coordinates coordinates
    orientation = :north

    final_coordinate = [0, 0]
    crossed_coordinates = Array.new
    crossed_coordinates.push(final_coordinate.dup)

    coordinates.split(", ").each do |move|
      distance = move.gsub(/R|L/, '').to_i
      orientation = get_new_orientation orientation, move

      distance.times do
        if orientation == :east
          final_coordinate[0] += 1
        elsif orientation == :west
          final_coordinate[0] -= 1
        elsif orientation == :north
          final_coordinate[1] += 1
        elsif orientation == :south
          final_coordinate[1] -= 1
        end
        crossed_coordinates.push(final_coordinate.dup)
      end
    end

    crossed_coordinates
  end

  def find_first_location_visited_twice visited_coordinates

    tested_coordinates = Array.new
    result = nil

    visited_coordinates.each do |coordinates|
      result = coordinates
      break if tested_coordinates.include? coordinates
      tested_coordinates.push(coordinates)
    end

    result
  end

  def solve coordinates
    final_position = get_coordinates coordinates
    get_distance final_position
  end

  def solve_day_2 coordinates
    visited_coordinates = get_crossed_coordinates coordinates
    result = find_first_location_visited_twice visited_coordinates
    get_distance result
  end
end
