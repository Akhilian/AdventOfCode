require_relative '../../day5/door_decoder_extended'

RSpec.describe DoorDecoder do
  let (:door_decoder) { described_class.new }

  describe "#find_hash" do
    subject { door_decoder.find_hash door, length }
    let (:door) { "abc" }

    context "hash with length of 1" do
      let (:length) { 1 }
      it { is_expected.to eq("_5______")}
    end

    context "hash with length of 2" do
      let (:length) { 2 }
      it { is_expected.to eq("_5__e___")}
    end

    context "hash with length of 8" do
      let (:length) { 8 }
      it { is_expected.to eq("05ace8e3")}
    end

    context "Real question and real answer" do
      let (:length) { 8 }
      let (:door) { "abbhdwsy" }
      it { is_expected.to eq("424a0197")}
    end
  end

  describe "#update_hash" do
    subject { door_decoder.update_hash md5 }
    context "with an hash that does not start with 5 zeros" do
      let ( :md5 ) { '0012367254' }
      it { is_expected.to eq(["_", "_", "_", "_", "_", "_", "_", "_"]) }
    end

    context "with a good hash" do
      let ( :md5 ) { '0000015367254' }
      it { is_expected.to eq(["_", "5", "_", "_", "_", "_", "_", "_"]) }
    end

    context "should ignore out of boundaries values" do
      let ( :md5 ) { '0000089367254' }
      it { is_expected.to eq(["_", "_", "_", "_", "_", "_", "_", "_"]) }
    end

    context "with a boundary index" do
      let ( :md5 ) { '0000009367254' }
      it { is_expected.to eq(["9", "_", "_", "_", "_", "_", "_", "_"]) }
    end

    context "with two changes" do
      let ( :md5 ) { '0000009367254' }
      it {
        is_expected.to eq(["9", "_", "_", "_", "_", "_", "_", "_"])
        door_decoder.update_hash '0000007367254'
        is_expected.to eq(["9", "_", "_", "_", "_", "_", "_", "_"])
      }
    end
  end

end
