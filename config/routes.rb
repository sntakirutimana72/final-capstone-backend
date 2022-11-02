# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :reservations, only: [:create,:destroy, :update]
  get 'logged_user', to: 'users#index'
  get 'reservations/mine'
  get 'reservations/room-list', to: 'reservations#roomList'
end
