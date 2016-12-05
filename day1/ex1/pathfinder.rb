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
    orientation = :north

    final_coordinate = [0, 0]

    coordinates.split(", ").each do |move|
      distance = move.gsub(/R|L/, '').to_i
      orientation = get_new_orientation orientation, move

      if orientation == :east
        final_coordinate[0] += distance
      elsif orientation == :west
        final_coordinate[0] -= distance
      elsif orientation == :north
        final_coordinate[1] += distance
      elsif orientation == :south
        final_coordinate[1] -= distance
      end
    end

    final_coordinate
  end

  def solve coordinates
    final_position = get_coordinates coordinates
    get_distance final_position
  end
end
