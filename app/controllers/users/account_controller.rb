class Users::AccountController < ApplicationController
  before_action :authenticate_user!

  def logged_user
    render json: current_user, status: :ok
  end
end
