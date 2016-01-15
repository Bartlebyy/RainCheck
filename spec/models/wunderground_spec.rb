require 'rails_helper'

describe Wunderground do
  describe '#generate_hourly_forecast' do
    let(:expected_result) {
      '\\n10: 33° 0% mostlycloudy' +
       '\\n11: 32° 0% partlycloudy' +
       '\\n12: 30° 0% partlycloudy' +
       '\\n01: 28° 0% clear' +
       '\\n02: 27° 0% clear' +
       '\\n03: 27° 0% clear' +
       '\\n04: 23° 0% clear' +
       '\\n05: 23° 0% clear' +
       '\\n06: 23° 0% clear' +
       '\\n07: 23° 0% clear' +
       '\\n08: 23° 0% clear' +
       '\\n09: 26° 0% clear'
    }

    subject { described_class.new('30308').generate_hourly_forecast }

    it 'works' do
      expect(subject).to eq(expected_result)
    end
  end
end
