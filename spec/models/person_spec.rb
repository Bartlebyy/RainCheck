require 'rails_helper'

describe Person do
  let(:person) { FactoryGirl.build(:person, zip_code: '12345') }
  let(:zipcode) { '30308' }

  describe '.update_zip' do
    it 'updates zipcode field for a person object' do
      expect(person.zip_code).to_not eq(zipcode)
      person.update_zip(zipcode)
      expect(person.zip_code).to eq(zipcode)
    end
  end
end
