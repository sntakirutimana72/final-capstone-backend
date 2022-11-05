require 'rails_helper'

RSpec.describe(Api::V1::ReservationsController, type: :request) do
  describe('invalid Authorization') do
    it('GET /reservations/mine') do
      get(api_v1_reservations_mine_path)
      expect(response).to have_http_status(:unauthorized)
    end

    it('DELETE /reservations/:id') do
      delete(api_v1_reservation_path(1))
      expect(response).to have_http_status(:unauthorized)
    end

    it('PATCH /reservations/:id') do
      patch(api_v1_reservation_path(1))
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe('valid Authorization') do
    before(:each) do
      @user, @headers = authorize
      @reservation = reserve_room(user: @user)
    end

    after { reset_all }

    describe('authorized') do
      it('fetch my reservations') do
        get(api_v1_reservations_mine_path, headers: @headers)
        expect(response).to have_http_status(:ok)
      end

      context('update reservation') do
        it('with only :to_date') do
          patch(
            api_v1_reservation_path(@reservation),
            headers: @headers,
            params: { reservation: { to_date: Date.today } }, as: :json
          )
          expect(response).to have_http_status(:ok)
        end

        it('with only :from_date') do
          patch(
            api_v1_reservation_path(@reservation),
            headers: @headers,
            params: { reservation: { from_date: Date.today } }, as: :json
          )
          expect(response).to have_http_status(:ok)
        end

        it('with both :from_date & :to_date') do
          patch(
            api_v1_reservation_path(@reservation),
            headers: @headers,
            params: { reservation: { from_date: Date.today, to_date: Date.today } }, as: :json
          )
          expect(response).to have_http_status(:ok)
        end
      end

      it('cancel the reservation') do
        delete(api_v1_reservation_path(@reservation), headers: @headers)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
