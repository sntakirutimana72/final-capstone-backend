require 'rails_helper'

RSpec.describe Api::V1::RoomsController, type: :controller do
    before :all do
        @user = User.create(username: 'test', email: 'user@gmail.com', password: '123456')
        @room = Room.create(name: 'Room 1', price: 100, number_of_beds: 2, picture: 'https://www.google.com', user_id: @user.id)
    end

    describe 'GET #index' do
        it 'returns a success response' do
            get :index
            expect(response).to be_successful
        end

        it 'returns a list of rooms' do
            get :index
            parse_response = JSON.parse(response.body)
            expect(parse_response).not_to be_empty
        end
    end
end