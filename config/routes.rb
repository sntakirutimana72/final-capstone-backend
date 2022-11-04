# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  devise_for :users, skip: :all
  devise_scope :user do
    post "/users/sign_in", to: "users/sessions#create", as: :user_session
    post "/users", to: "users/registrations#create", as: :user_registration
    delete "/users/sign_out", to: "users/sessions#destroy", as: :destroy_user_session
  end

  get 'logged_user', to: 'users/account#logged_user'

  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show, :create]
      get 'reservations/mine'
      get 'room-dependencies', to: 'rooms#dependencies'
      get 'room-list', to: 'room#room_list'
      resources :reservations, only: [:create, :destroy, :update]
    end
  end
end
