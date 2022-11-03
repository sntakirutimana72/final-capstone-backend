require 'rails_helper'

RSpec.describe 'RoomsTypes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/rooms_types/index'
      expect(response).to have_http_status(:success)
    end
  end
end
