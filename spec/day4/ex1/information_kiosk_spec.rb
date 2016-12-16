require_relative '../../../day4/ex1/information_kiosk'

RSpec.describe InformationKiosk do
  describe "#from_file" do
    it "should load Room from file" do
      information_kiosk = described_class.new
      information_kiosk.from_file 'spec/day4/ex1/test.txt'

      expect(information_kiosk.rooms.size).to eq(4)
      roomOne = information_kiosk.rooms[0]
      expect(roomOne.sector_id).to eq("123")
      expect(roomOne.checksum).to eq("abxyz")
      expect(roomOne.name).to eq("aaaaa-bbb-z-y-x")
    end

    it "should load Room from file" do
      information_kiosk = described_class.new
      information_kiosk.from_file 'spec/day4/ex1/test.txt'

      roomOne = information_kiosk.rooms[1]
      expect(roomOne.sector_id).to eq("987")
      expect(roomOne.checksum).to eq("abcde")
      expect(roomOne.name).to eq("a-b-c-d-e-f-g-h")
    end
  end

  describe "valid_rooms" do
    it "should return valid rooms" do
      information_kiosk = described_class.new
      information_kiosk.from_file 'spec/day4/ex1/test.txt'

      expect(information_kiosk.valid_rooms.size).to eq(3)
    end
  end

  describe "find_storage" do
    it "should return the sum of sector IDs" do
      information_kiosk = described_class.new
      information_kiosk.from_file 'spec/day4/input.txt'

      room = information_kiosk.find_storage
      expect(room.name).to eq("kloqemlib-lygbzq-pqloxdb")
      expect(room.sector_id).to eq("991")
    end
  end

  describe "sum_of_sector" do
    it "should return the sum of sector IDs" do
      information_kiosk = described_class.new
      information_kiosk.from_file 'spec/day4/ex1/test.txt'

      expect(information_kiosk.sum_of_sector).to eq(1514)
    end

    it "should return the sum of sector IDs for the real case" do
      information_kiosk = described_class.new
      information_kiosk.from_file 'spec/day4/input.txt'

      expect(information_kiosk.sum_of_sector).to eq(409147)
    end
  end
end
