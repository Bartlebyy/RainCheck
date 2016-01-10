require 'rails_helper'

describe StaticPagesController do
  describe '#home' do
    context 'when there are no params' do
      let(:default_message) { 'Thanks for visiting us online! Buh-bye now!' }

      it 'should return the default message' do
        get :home
        expect(assigns['reply']).to eq(default_message)
      end
    end

    context 'when there are params' do
      describe 'and they are weird' do
        let(:zipcode_message) { 'Please input a valid zipcode in the form 12345 or 12345-1234' }

        it 'should return the default message' do
          get :home, From: '1234567890', Body: 'wat'
          expect(assigns['reply']).to include(zipcode_message)
        end
      end

      describe 'and they are perfect' do
        context 'and the body is a zipcode' do
          let(:default_message) { 'Thanks for visiting us online! Buh-bye now!' }

          it 'should return an hourly forecast' do
            get :home, From: '1234567890', Body: 30308
            expect(assigns['reply']).to include(':')
            expect(assigns['reply']).to include('°')
            expect(assigns['reply']).to include('%')
          end
        end
      end
    end

    it 'renders the home template' do
      get :home
      expect(response).to render_template('home')
    end
  end
end
