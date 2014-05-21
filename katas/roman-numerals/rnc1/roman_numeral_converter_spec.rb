require './roman_numeral_converter.rb'

describe RomanNumeralConverter do
  context 'when converting from arabic to roman' do
    it { expect(RomanNumeralConverter.(1)).to eq('I') }
    it { expect(RomanNumeralConverter.(2)).to eq('II') }
    it { expect(RomanNumeralConverter.(4)).to eq('IV') }
    it { expect(RomanNumeralConverter.(5)).to eq('V') }
    it { expect(RomanNumeralConverter.(6)).to eq('VI') }
    it { expect(RomanNumeralConverter.(9)).to eq('IX') }
    it { expect(RomanNumeralConverter.(10)).to eq('X') }
    it { expect(RomanNumeralConverter.(20)).to eq('XX') }
    it { expect(RomanNumeralConverter.(40)).to eq('XL') }
    it { expect(RomanNumeralConverter.(50)).to eq('L') }
    it { expect(RomanNumeralConverter.(90)).to eq('XC') }
    it { expect(RomanNumeralConverter.(100)).to eq('C') }
    it { expect(RomanNumeralConverter.(400)).to eq('CD') }
    it { expect(RomanNumeralConverter.(500)).to eq('D') }
    it { expect(RomanNumeralConverter.(900)).to eq('CM') }
    it { expect(RomanNumeralConverter.(1000)).to eq('M') }

    it { expect(RomanNumeralConverter.(2014)).to eq('MMXIV') }
    it { expect(RomanNumeralConverter.(3999)).to eq('MMMCMXCIX') }
    it { expect(RomanNumeralConverter.(0)).to eq('') }
    it { expect(RomanNumeralConverter.(-1)).to eq('-I') }
  end

  context 'when converting from roman to arabic' do
    it { expect(RomanNumeralConverter.('I')).to eq(1) }
    it { expect(RomanNumeralConverter.('II')).to eq(2) }
    it { expect(RomanNumeralConverter.('IV')).to eq(4) }
    it { expect(RomanNumeralConverter.('V')).to eq(5) }
    it { expect(RomanNumeralConverter.('VI')).to eq(6) }
    it { expect(RomanNumeralConverter.('IX')).to eq(9) }
    it { expect(RomanNumeralConverter.('X')).to eq(10) }
    it { expect(RomanNumeralConverter.('XX')).to eq(20) }
    it { expect(RomanNumeralConverter.('XL')).to eq(40) }
    it { expect(RomanNumeralConverter.('L')).to eq(50) }
    it { expect(RomanNumeralConverter.('XC')).to eq(90) }
    it { expect(RomanNumeralConverter.('C')).to eq(100) }
    it { expect(RomanNumeralConverter.('CD')).to eq(400) }
    it { expect(RomanNumeralConverter.('D')).to eq(500) }
    it { expect(RomanNumeralConverter.('CM')).to eq(900) }
    it { expect(RomanNumeralConverter.('M')).to eq(1000) }

    it { expect(RomanNumeralConverter.('MMXIV')).to eq(2014) }
    it { expect(RomanNumeralConverter.('MMMCMXCIX')).to eq(3999) }
    it { expect(RomanNumeralConverter.('')).to eq(0) }
    it { expect(RomanNumeralConverter.('-I')).to eq(-1) }
  end
end

