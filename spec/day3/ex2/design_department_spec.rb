require_relative '../../../day3/ex2/Triangle'
require_relative '../../../day3/ex2/DesignDepartment'

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
        design_department.from_file 'spec/day3/ex2/test.txt'

        expect(design_department.triangles.size).to eq(6)
        expect(design_department.triangles[0]).to eq(Triangle.new ["101", "102", "103"])
        expect(design_department.triangles[1]).to eq(Triangle.new ["201", "202", "203"])
        expect(design_department.triangles[2]).to eq(Triangle.new ["301", "302", "303"])
        expect(design_department.triangles[3]).to eq(Triangle.new ["401", "402", "403"])
        expect(design_department.triangles[4]).to eq(Triangle.new ["501", "502", "503"])
        expect(design_department.triangles[5]).to eq(Triangle.new ["601", "602", "603"])
      end
    end

    context "when the file is THE ONE" do
      it "should load triangles from file" do
        design_department = described_class.new
        design_department.from_file 'spec/day3/input.txt'

        expect(design_department.triangles.size).to eq(1599)
        expect(design_department.get_valid.size).to eq(1544)
      end
    end
  end
end
