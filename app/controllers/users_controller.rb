class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: user_to_json(current_user), status: :ok
  end
end
