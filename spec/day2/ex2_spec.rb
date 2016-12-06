require_relative '../../day2/ex1/SecretBathroomCode'

RSpec.describe SecretBathroomCode do
  subject { described_class.new }
  context '#find_next_step' do
    it { expect(subject.find_next_step '1', 'U').to eq('1') }
    it { expect(subject.find_next_step '1', 'D').to eq('3') }
    it { expect(subject.find_next_step '1', 'R').to eq('1') }
    it { expect(subject.find_next_step '1', 'L').to eq('1') }

    it { expect(subject.find_next_step '2', 'U').to eq('2') }
    it { expect(subject.find_next_step '2', 'D').to eq('6') }
    it { expect(subject.find_next_step '2', 'R').to eq('3') }
    it { expect(subject.find_next_step '2', 'L').to eq('2') }

    it { expect(subject.find_next_step '3', 'U').to eq('1') }
    it { expect(subject.find_next_step '3', 'D').to eq('7') }
    it { expect(subject.find_next_step '3', 'L').to eq('2') }
    it { expect(subject.find_next_step '3', 'R').to eq('4') }

    it { expect(subject.find_next_step '4', 'U').to eq('4') }
    it { expect(subject.find_next_step '4', 'D').to eq('8') }
    it { expect(subject.find_next_step '4', 'L').to eq('3') }
    it { expect(subject.find_next_step '4', 'R').to eq('4') }

    it { expect(subject.find_next_step '5', 'U').to eq('5') }
    it { expect(subject.find_next_step '5', 'D').to eq('5') }
    it { expect(subject.find_next_step '5', 'L').to eq('5') }
    it { expect(subject.find_next_step '5', 'R').to eq('6') }

    it { expect(subject.find_next_step '6', 'U').to eq('2') }
    it { expect(subject.find_next_step '6', 'D').to eq('A') }
    it { expect(subject.find_next_step '6', 'L').to eq('5') }
    it { expect(subject.find_next_step '6', 'R').to eq('7') }

    it { expect(subject.find_next_step '7', 'U').to eq('3') }
    it { expect(subject.find_next_step '7', 'D').to eq('B') }
    it { expect(subject.find_next_step '7', 'L').to eq('6') }
    it { expect(subject.find_next_step '7', 'R').to eq('8') }

    it { expect(subject.find_next_step '8', 'U').to eq('4') }
    it { expect(subject.find_next_step '8', 'D').to eq('C') }
    it { expect(subject.find_next_step '8', 'L').to eq('7') }
    it { expect(subject.find_next_step '8', 'R').to eq('9') }

    it { expect(subject.find_next_step '9', 'U').to eq('9') }
    it { expect(subject.find_next_step '9', 'D').to eq('9') }
    it { expect(subject.find_next_step '9', 'L').to eq('8') }
    it { expect(subject.find_next_step '9', 'R').to eq('9') }

    it { expect(subject.find_next_step 'A', 'U').to eq('6') }
    it { expect(subject.find_next_step 'A', 'R').to eq('B') }
    it { expect(subject.find_next_step 'A', 'D').to eq('A') }
    it { expect(subject.find_next_step 'A', 'L').to eq('A') }

    it { expect(subject.find_next_step 'B', 'U').to eq('7') }
    it { expect(subject.find_next_step 'B', 'R').to eq('C') }
    it { expect(subject.find_next_step 'B', 'D').to eq('D') }
    it { expect(subject.find_next_step 'B', 'L').to eq('A') }

    it { expect(subject.find_next_step 'C', 'U').to eq('8') }
    it { expect(subject.find_next_step 'C', 'R').to eq('C') }
    it { expect(subject.find_next_step 'C', 'D').to eq('C') }
    it { expect(subject.find_next_step 'C', 'L').to eq('B') }

    it { expect(subject.find_next_step 'D', 'U').to eq('B') }
    it { expect(subject.find_next_step 'D', 'R').to eq('D') }
    it { expect(subject.find_next_step 'D', 'D').to eq('D') }
    it { expect(subject.find_next_step 'D', 'L').to eq('D') }
  end

  context '#solve' do
    it { expect(subject.solve ['ULL', 'RRDDD', 'LURDL', 'UUUUD']).to eq('5DB3') }
    it {
      lines = ['LURLDDLDULRURDUDLRULRDLLRURDUDRLLRLRURDRULDLRLRRDDULUDULURULLURLURRRLLDURURLLUURDLLDUUDRRDLDLLRUUDURURRULURUURLDLLLUDDUUDRULLRUDURRLRLLDRRUDULLDUUUDLDLRLLRLULDLRLUDLRRULDDDURLUULRDLRULRDURDURUUUDDRRDRRUDULDUUULLLLURRDDUULDRDRLULRRRUUDUURDULDDRLDRDLLDDLRDLDULUDDLULUDRLULRRRRUUUDULULDLUDUUUUDURLUDRDLLDDRULUURDRRRDRLDLLURLULDULRUDRDDUDDLRLRRDUDDRULRULULRDDDDRDLLLRURDDDDRDRUDUDUUDRUDLDULRUULLRRLURRRRUUDRDLDUDDLUDRRURLRDDLUUDUDUUDRLUURURRURDRRRURULUUDUUDURUUURDDDURUDLRLLULRULRDURLLDDULLDULULDDDRUDDDUUDDUDDRRRURRUURRRRURUDRRDLRDUUULLRRRUDD',
        'DLDUDULDLRDLUDDLLRLUUULLDURRUDLLDUDDRDRLRDDUUUURDULDULLRDRURDLULRUURRDLULUDRURDULLDRURUULLDLLUDRLUDRUDRURURUULRDLLDDDLRUDUDLUDURLDDLRRUUURDDDRLUDDDUDDLDUDDUUUUUULLRDRRUDRUDDDLLLDRDUULRLDURLLDURUDDLLURDDLULLDDDRLUDRDDLDLDLRLURRDURRRUDRRDUUDDRLLUDLDRLRDUDLDLRDRUDUUULULUDRRULUDRDRRLLDDRDDDLULURUURULLRRRRRDDRDDRRRDLRDURURRRDDULLUULRULURURDRRUDURDDUURDUURUURUULURUUDULURRDLRRUUDRLLDLDRRRULDRLLRLDUDULRRLDUDDUUURDUDLDDDUDL',
        'RURDRUDUUUUULLLUULDULLLDRUULURLDULULRDDLRLLRURULLLLLLRULLURRDLULLUULRRDURRURLUDLULDLRRULRDLDULLDDRRDLLRURRDULULDRRDDULDURRRUUURUDDURULUUDURUULUDLUURRLDLRDDUUUUURULDRDUDDULULRDRUUURRRDRLURRLUUULRUDRRLUDRDLDUDDRDRRUULLLLDUUUULDULRRRLLRLRLRULDLRURRLRLDLRRDRDRLDRUDDDUUDRLLUUURLRLULURLDRRULRULUDRUUURRUDLDDRRDDURUUULLDDLLDDRUDDDUULUDRDDLULDDDDRULDDDDUUUURRLDUURULRDDRDLLLRRDDURUDRRLDUDULRULDDLDDLDUUUULDLLULUUDDULUUDLRDRUDLURDULUDDRDRDRDDURDLURLULRUURDUDULDDLDDRUULLRDRLRRUURRDDRDUDDLRRLLDRDLUUDRRDDDUUUDLRRLDDDUDRURRDDUULUDLLLRUDDRULRLLLRDLUDUUUUURLRRUDUDDDDLRLLULLUDRDURDDULULRDRDLUDDRLURRLRRULRL',
        'LDUURLLULRUURRDLDRUULRDRDDDRULDLURDDRURULLRUURRLRRLDRURRDRLUDRUUUULLDRLURDRLRUDDRDDDUURRDRRURULLLDRDRDLDUURLDRUULLDRDDRRDRDUUDLURUDDLLUUDDULDDULRDDUUDDDLRLLLULLDLUDRRLDUUDRUUDUDUURULDRRLRRDLRLURDRURURRDURDURRUDLRURURUUDURURUDRURULLLLLUDRUDUDULRLLLRDRLLRLRLRRDULRUUULURLRRLDRRRDRULRUDUURRRRULDDLRULDRRRDLDRLUDLLUDDRURLURURRLRUDLRLLRDLLDRDDLDUDRDLDDRULDDULUDDLLDURDULLDURRURRULLDRLUURURLLUDDRLRRUUDULRRLLRUDRDUURLDDLLURRDLRUURLLDRDLRUULUDURRDULUULDDLUUUDDLRRDRDUDLRUULDDDLDDRUDDD',
        'DRRDRRURURUDDDRULRUDLDLDULRLDURURUUURURLURURDDDDRULUDLDDRDDUDULRUUULRDUDULURLRULRDDLDUDLDLULRULDRRLUDLLLLURUDUDLLDLDRLRUUULRDDLUURDRRDLUDUDRULRRDDRRLDUDLLDLURLRDLRUUDLDULURDDUUDDLRDLUURLDLRLRDLLRUDRDUURDDLDDLURRDDRDRURULURRLRLDURLRRUUUDDUUDRDRULRDLURLDDDRURUDRULDURUUUUDULURUDDDDUURULULDRURRDRDURUUURURLLDRDLDLRDDULDRLLDUDUDDLRLLRLRUUDLUDDULRLDLLRLUUDLLLUUDULRDULDLRRLDDDDUDDRRRDDRDDUDRLLLDLLDLLRDLDRDLUDRRRLDDRLUDLRLDRUURUDURDLRDDULRLDUUUDRLLDRLDLLDLDRRRLLULLUDDDLRUDULDDDLDRRLLRDDLDUULRDLRRLRLLRUUULLRDUDLRURRRUULLULLLRRURLRDULLLRLDUUUDDRLRLUURRLUUUDURLRDURRDUDDUDDRDDRUD']

      expect(subject.solve lines).to eq('9A7DC')
    }
  end
end
