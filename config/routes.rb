# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'rooms_types/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

    resources :rooms

    resources :rooms_types

  get 'logged_user', to: 'users#index'


    
 


end
