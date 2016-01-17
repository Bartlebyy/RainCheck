require 'rails_helper'

describe Text do
  let(:phone_number) { '+13051234567' }

  describe '#run' do
    context 'when body is a zipcode' do
      let(:message) { '30308' }

      subject { described_class.new(phone_number, message).run }

      context 'when person is new' do
        it 'creates a new person object' do
          expect(Person.all.count).to eq(0)
          subject
          expect(Person.all.count).to eq(1)
        end

        it 'updates zipcode' do
          subject
          expect(Person.last.zip_code).to eq(message)
        end

        it 'returns hourly data' do
          expect(subject).to include(':', '°', '%')
        end
      end

      context 'when person is already a user' do
        let!(:person) do
          FactoryGirl.create(:person, phone_number: phone_number,
                                      zip_code: '12345')
        end

        it 'does not create a new person object' do
          expect(Person.all.count).to eq(1)
          subject
          expect(Person.all.count).to eq(1)
        end

        it 'updates zipcode' do
          subject
          expect(Person.last.zip_code).to eq(message)
        end

        it 'returns hourly data' do
          expect(subject).to include(':', '°', '%')
        end
      end
    end

    context 'when body is not a zipcode' do
      let(:message) { '2020' }

      subject { described_class.new(phone_number, message).run }

      it { expect(subject).to eq('Please input a valid zipcode in the form 12345 or 12345-1234') }
    end
  end
end
