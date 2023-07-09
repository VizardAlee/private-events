Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'events#index'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :events, only: [:new, :create, :index]

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
