# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'rooms_types/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :reservations, only: [:create,:destroy, :update]
  get 'logged_user', to: 'users#index'
  get 'reservations/mine'
  get 'room-list', to: 'room#room_list'
    resources :rooms
  resources :reservations, only: [:destroy, :update]
  get 'logged_user', to: 'users#index'
  get 'reservations/mine'

    resources :rooms_types
  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show]
    end
  end
end
