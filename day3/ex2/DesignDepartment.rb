class DesignDepartment

  attr_reader :triangles

  def initialize triangles = []
    @triangles = triangles
  end

  def get_valid
    @triangles.select { |triangle| triangle.valid? }
  end

  def from_file file
    loaded_triangles = []
    File.open(file, "r") do |f|
      f.each_line do |line|
        loaded_triangles.push(line.split(" "))
      end
    end

    @triangles = loaded_triangles
      .transpose
      .flatten
      .each_slice(3)
      .to_a
      .map { |triangle| Triangle.new triangle }
  end

end
