require_relative '../../day6/message'

RSpec.describe Message do
  let (:message) { described_class.new init_value }

  describe "#initialize" do
    context "have payload message" do
      let (:init_value) { ['12345', '67890'] }
      it { expect(message.payload).to eq(['12345', '67890'])}
    end
  end

  describe "#decrypt" do
    subject { message.decrypt }
    context "with the initial example" do
      let (:init_value) { ["eedadn", "drvtee", "eandsr", "raavrd", "atevrs", "tsrnev", "sdttsa", "rasrtv", "nssdts",
        "ntnada", "svetve", "tesnvt", "vntsnd", "vrdear", "dvrsen", "enarar"] }
      it { is_expected.to eq("easter")}
    end

    context "with exercise data" do
      input = []

      before(:all) do
        File.foreach('./spec/day6/input.txt') do |line|
          input.push(line.chomp)
        end
      end

      let (:init_value) { input }
      it { is_expected.to eq("afwlyyyq")}
    end
  end

  describe "#decrypt_modified" do
    subject { message.decrypt_modified }
    context "with the initial example" do
      let (:init_value) { ["eedadn", "drvtee", "eandsr", "raavrd", "atevrs", "tsrnev", "sdttsa", "rasrtv", "nssdts",
        "ntnada", "svetve", "tesnvt", "vntsnd", "vrdear", "dvrsen", "enarar"] }
      it { is_expected.to eq("advent")}
    end

    context "with exercise data" do
      input = []

      before(:all) do
        File.foreach('./spec/day6/input.txt') do |line|
          input.push(line.chomp)
        end
      end

      let (:init_value) { input }
      it { is_expected.to eq("afwlyyyq")}
    end
  end
end
