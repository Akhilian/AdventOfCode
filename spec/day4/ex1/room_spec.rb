require_relative '../../../day4/ex1/room'

RSpec.describe Room do
  describe "#initialize" do
    subject (:room) { described_class.new init_value }
    context "with first example" do
      let(:init_value) { 'aaaaa-bbb-z-y-x-123[abxyz]' }
      it {
        expect(subject.name).to eq('aaaaa-bbb-z-y-x')
        expect(subject.sector_id).to eq('123')
        expect(subject.checksum).to eq('abxyz')
      }
    end

    context "with second example" do
      let(:init_value) { 'a-b-c-d-e-f-g-h-987[abcde]' }
      it {
        expect(subject.name).to eq('a-b-c-d-e-f-g-h')
        expect(subject.sector_id).to eq('987')
        expect(subject.checksum).to eq('abcde')
      }
    end

    context "with third example" do
      let(:init_value) { 'not-a-real-room-404[oarel]' }
      it {
        expect(subject.name).to eq('not-a-real-room')
        expect(subject.sector_id).to eq('404')
        expect(subject.checksum).to eq('oarel')
      }
    end

    context "with fourth example" do
      let(:init_value) { 'totally-real-room-200[decoy]' }
      it {
        expect(subject.name).to eq('totally-real-room')
        expect(subject.sector_id).to eq('200')
        expect(subject.checksum).to eq('decoy')
      }
    end
  end

  describe "#calcul_checksum" do
    let(:room) { described_class.new init_value }
    subject { room.calcul_checksum }
    context "with first example" do
      let(:init_value) { 'aaaaa-bbb-z-y-x-123[abxyz]' }
      it { is_expected.to eq('abxyz') }
    end

    context "with second example" do
      let(:init_value) { 'a-b-c-d-e-f-g-h-987[abcde]' }
      it { is_expected.to eq('abcde') }
    end

    context "with third example" do
      let(:init_value) { 'not-a-real-room-404[oarel]' }
      it { is_expected.to eq('oarel') }
    end

    context "with third example" do
      let(:init_value) { 'totally-real-room-200[decoy]' }
      it { is_expected.to eq('loart') }
    end
  end

  describe "#decoy?" do
    let(:room) { described_class.new init_value }

    subject { room.decoy? }
    context "with first example" do
      let(:init_value) { 'aaaaa-bbb-z-y-x-123[abxyz]' }
      it { is_expected.to be_truthy }
    end

    context "with second example" do
      let(:init_value) { 'a-b-c-d-e-f-g-h-987[abcde]' }
      it { is_expected.to be_truthy }
    end

    context "with third example" do
      let(:init_value) { 'not-a-real-room-404[oarel]' }
      it { is_expected.to be_truthy }
    end

    context "with fourth example" do
      let(:init_value) { 'totally-real-room-200[decoy]' }
      it { is_expected.to be_falsy }
    end
  end

  describe "#initialize" do
    let(:room) { described_class.new init_value }
    subject { room.decipher }
    context "with first example" do
      let(:init_value) { 'qzmt-zixmtkozy-ivhz-343[abxyz]' }
      it { is_expected.to eq("very encrypted name") }
    end
  end
end
