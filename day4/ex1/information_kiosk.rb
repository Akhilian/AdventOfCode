require_relative './room'

class InformationKiosk

  attr_reader :rooms

  def initialize
    @rooms = []
  end

  def from_file file
    rooms = []
    File.open(file, "r") do |f|
      f.each_line do |line|
        rooms.push(Room.new line)
      end
    end

    @rooms = rooms
  end

  def sum_of_sector
    valid_rooms
      .map { |room| room.sector_id.to_i }
      .inject(0){|sum,x| sum + x }
  end

  def valid_rooms
    @rooms
      .select { |room| room.decoy? }
  end

  def find_storage
    valid_rooms
      .map { |room| [room, room.decipher] }
      .select { |room| room[1] == "northpole object storage" }
      .flatten(1)[0]
  end

end
