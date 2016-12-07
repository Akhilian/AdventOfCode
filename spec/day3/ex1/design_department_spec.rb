require_relative '../../../day3/ex1/Triangle'
require_relative '../../../day3/ex1/DesignDepartment'

RSpec.describe DesignDepartment do
  let(:design_department) { described_class.new init_value }

  describe "#get_valid" do
    subject { design_department.get_valid }

    context "when input is empty" do
      let(:init_value) { [] }
      it { is_expected.to eq([]) }
    end

    context "when input is valid" do
      let(:init_value) { [Triangle.new([783, 255, 616])] }
      it { is_expected.to eq([Triangle.new([783, 255, 616])]) }
    end

    context "when input is not valid" do
      let(:init_value) { [Triangle.new([5, 10, 25])] }
      it { is_expected.to eq([]) }
    end

    context "when input is not valid" do
      let(:init_value) { [Triangle.new([5, 10, 25]), Triangle.new([783, 255, 616])] }
      it { is_expected.to eq([Triangle.new([783, 255, 616])]) }
    end
  end

  describe "#from_file" do
    context "when the file is small test" do
      it "should load triangles from file" do
        design_department = described_class.new
        design_department.from_file 'spec/day3/ex1/test.txt'

        expect(design_department.triangles.size).to eq(6)
        expect(design_department.get_valid.size).to eq(4)
      end
    end

    context "when the file is THE ONE" do
      it "should load triangles from file" do
        design_department = described_class.new
        design_department.from_file 'spec/day3/input.txt'

        expect(design_department.triangles.size).to eq(1599)
        expect(design_department.get_valid.size).to eq(869)
      end
    end
  end
end
