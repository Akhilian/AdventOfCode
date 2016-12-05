require_relative '../../day1/ex1/pathfinder'

RSpec.describe PathFinder do
  subject { described_class.new }
  context '#get_coordinates' do
    it { expect(subject.get_coordinates 'R3').to eq([3, 0]) }
    it { expect(subject.get_coordinates 'L2').to eq([-2, 0]) }
    it { expect(subject.get_coordinates 'R3, L3').to eq([3, 3]) }
    it { expect(subject.get_coordinates 'R2, L2, R2').to eq([4, 2]) }
    it { expect(subject.get_coordinates 'R2').to eq([2, 0]) }
    it { expect(subject.get_coordinates 'R2, R2').to eq([2, -2]) }
    it { expect(subject.get_coordinates 'R2, R2, R2').to eq([0, -2]) }
    it { expect(subject.get_coordinates 'R3, L5, R2, L2, R1, L3, R1, R3').to eq([7, 7]) }
  end

  context '#get_new_orientation' do
    it 'should' do
      expect(subject.get_new_orientation :north, 'R2').to eq(:east)
      expect(subject.get_new_orientation :east, 'R2').to eq(:south)
      expect(subject.get_new_orientation :south, 'R2').to eq(:west)
      expect(subject.get_new_orientation :west, 'R2').to eq(:north)

      expect(subject.get_new_orientation :north, 'L2').to eq(:west)
      expect(subject.get_new_orientation :west, 'L2').to eq(:south)
      expect(subject.get_new_orientation :south, 'L2').to eq(:east)
      expect(subject.get_new_orientation :east, 'L2').to eq(:north)
    end
  end

  context '#get_distance' do
    it 'should' do
       expect(subject.get_distance [0, 0]).to eq(0)
       expect(subject.get_distance [2, 3]).to eq(5)
    end
  end

  context '#solve' do
    it 'should' do
      expect(subject.solve 'R2, L3').to eq(5)
      expect(subject.solve 'R2, R2, R2').to eq(2)
      expect(subject.solve 'R5, L5, R5, R3').to eq(12)
      expect(subject.solve 'R3, L5, R2, L2, R1, L3, R1, R3, L4, R3, L1, L1, R1, L3, R2, L3, L2, R1, R1, L1, R4, L1, L4, R3, L2, L2, R1, L1, R5, R4, R2, L5, L2, R5, R5, L2, R3, R1, R1, L3, R1, L4, L4, L190, L5, L2, R4, L5, R4, R5, L4, R1, R2, L5, R50, L2, R1, R73, R1, L2, R191, R2, L4, R1, L5, L5, R5, L3, L5, L4, R4, R5, L4, R4, R4, R5, L2, L5, R3, L4, L4, L5, R2, R2, R2, R4, L3, R4, R5, L3, R5, L2, R3, L1, R2, R2, L3, L1, R5, L3, L5, R2, R4, R1, L1, L5, R3, R2, L3, L4, L5, L1, R3, L5, L2, R2, L3, L4, L1, R1, R4, R2, R2, R4, R2, R2, L3, L3, L4, R4, L4, L4, R1, L4, L4, R1, L2, R5, R2, R3, R3, L2, L5, R3, L3, R5, L2, R3, R2, L4, L3, L1, R2, L2, L3, L5, R3, L1, L3, L4, L3').to eq(291)
    end
  end
end
