# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:create, :index, :show, :destroy]
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'logged_user', to: 'users#index'
end
