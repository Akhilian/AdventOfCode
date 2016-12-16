require_relative '../../day5/door_decoder'

RSpec.describe DoorDecoder do
  let (:door_decoder) { described_class.new }

  describe "#find_hash" do
    subject { door_decoder.find_hash door, length }
    let (:door) { "abc" }

    context "hash with length of 1" do
      let (:length) { 1 }
      it { is_expected.to eq("1")}
    end

    context "hash with length of 2" do
      let (:length) { 2 }
      it { is_expected.to eq("18")}
    end

    context "hash with length of 8" do
      let (:length) { 8 }
      it { is_expected.to eq("18f47a30")}
    end

    context "Real question and real answer" do
      let (:length) { 8 }
      let (:door) { "abbhdwsy" }
      it { is_expected.to eq("801b56a7")}
    end
  end

end
