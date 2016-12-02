require_relative '../../day1/ex1/pathfinder'

RSpec.describe PathFinder do
  context "#get_coordinates" do
    it "should" do
      expect(PathFinder.get_coordinates "R3").to eq([3, 0])
      expect(PathFinder.get_coordinates "L2").to eq([-2, 0])
      expect(PathFinder.get_coordinates "R3, L3").to eq([3, 3])
      expect(PathFinder.get_coordinates "R2, L2, R2").to eq([4, 2])
      expect(PathFinder.get_coordinates "R2").to eq([2, 0])
      expect(PathFinder.get_coordinates "R2, R2").to eq([2, -2])
      expect(PathFinder.get_coordinates "R2, R2, R2").to eq([0, -2])
      expect(PathFinder.get_coordinates "R3, L5, R2, L2, R1, L3, R1, R3").to eq([7, 7])
    end
  end

  context "#get_new_orientation" do
    it "should" do
      expect(PathFinder.get_new_orientation :north, "R2").to eq(:east)
      expect(PathFinder.get_new_orientation :east, "R2").to eq(:south)
      expect(PathFinder.get_new_orientation :south, "R2").to eq(:west)
      expect(PathFinder.get_new_orientation :west, "R2").to eq(:north)

      expect(PathFinder.get_new_orientation :north, "L2").to eq(:west)
      expect(PathFinder.get_new_orientation :west, "L2").to eq(:south)
      expect(PathFinder.get_new_orientation :south, "L2").to eq(:east)
      expect(PathFinder.get_new_orientation :east, "L2").to eq(:north)
    end
  end

  context "#get_distance" do
    it "should" do
       expect(PathFinder.get_distance [0, 0]).to eq(0)
       expect(PathFinder.get_distance [2, 3]).to eq(5)
    end
  end

  context "#solve" do
    it "should" do
      expect(PathFinder.solve "R2, L3").to eq(5)
      expect(PathFinder.solve "R2, R2, R2").to eq(2)
      expect(PathFinder.solve "R5, L5, R5, R3").to eq(12)
    end
  end
end
