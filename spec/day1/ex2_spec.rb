require_relative '../../day1/ex1/pathfinder'

RSpec.describe PathFinder do
  subject { described_class.new }
  context '#get_crossed_coordinates' do
    it { expect(subject.get_crossed_coordinates '').to eq([[0, 0]]) }
    it { expect(subject.get_crossed_coordinates 'R1').to eq([[0, 0], [1, 0]]) }
    it { expect(subject.get_crossed_coordinates 'R1, R1').to eq([[0, 0], [1, 0], [1, -1]]) }
    it { expect(subject.get_crossed_coordinates 'L2').to eq([[0, 0], [-1, 0], [-2, 0]]) }
  end

  context '#find_first_location_visited_twice' do
    it { expect(subject.find_first_location_visited_twice [[0, 0], [0, 0]]).to eq([0, 0]) }
    it { expect(subject.find_first_location_visited_twice [[0, 0], [1, 1], [1, 1]]).to eq([1, 1]) }
    it { expect(subject.find_first_location_visited_twice [[0, 0], [1, 1], [2, 2], [2, 1], [2, 2], [1, 1]]).to eq([2, 2]) }
  end

  context '#solve_day_2' do
    it { expect(subject.solve_day_2 'R8, R4, R4, R8').to eq(4) }
    it { expect(subject.solve_day_2 'R3, L5, R2, L2, R1, L3, R1, R3, L4, R3, L1, L1, R1, L3, R2, L3, L2, R1, R1, L1, R4, L1, L4, R3, L2, L2, R1, L1, R5, R4, R2, L5, L2, R5, R5, L2, R3, R1, R1, L3, R1, L4, L4, L190, L5, L2, R4, L5, R4, R5, L4, R1, R2, L5, R50, L2, R1, R73, R1, L2, R191, R2, L4, R1, L5, L5, R5, L3, L5, L4, R4, R5, L4, R4, R4, R5, L2, L5, R3, L4, L4, L5, R2, R2, R2, R4, L3, R4, R5, L3, R5, L2, R3, L1, R2, R2, L3, L1, R5, L3, L5, R2, R4, R1, L1, L5, R3, R2, L3, L4, L5, L1, R3, L5, L2, R2, L3, L4, L1, R1, R4, R2, R2, R4, R2, R2, L3, L3, L4, R4, L4, L4, R1, L4, L4, R1, L2, R5, R2, R3, R3, L2, L5, R3, L3, R5, L2, R3, R2, L4, L3, L1, R2, L2, L3, L5, R3, L1, L3, L4, L3').to eq(159) }
  end
end
