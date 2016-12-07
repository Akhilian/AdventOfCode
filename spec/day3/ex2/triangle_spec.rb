require_relative '../../../day3/ex1/Triangle'

RSpec.describe Triangle do
  let(:triangle) { described_class.new init_value }
  describe "#valid?" do
    subject { triangle.valid? }
    context "when triangle is valid" do
      let(:init_value) { [783, 255, 616] }
      it { is_expected.to be_truthy }
    end

    context "when triangle is not valid" do
      let(:init_value) { [5, 10, 25] }
      it { is_expected.to be_falsy }
    end

    context "when triangle is valid" do
      let(:init_value) { ["783", "255", "616"] }
      it { is_expected.to be_truthy }
    end
  end
end
