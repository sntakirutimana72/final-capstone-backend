# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do  
  
  devise_scope :user do
    post "/users/sign_in" => "users/sessions#create", as: :user_session
    post "/users" => "users/registrations#create", as: :user_registration
    delete "/users/sign_out" => "users/sessions#destroy", as: :destroy_user_session
    get 'logged_user', to: 'users/sessions#logged_user'
  end
 
  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show]
      get 'reservations/mine'
      get 'room-list', to: 'room#room_list' 
      resources :reservations, only: [:create,:destroy, :update]
      get 'rooms_types/index'
    end
  end
end
