Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :guns
  resources :bookings do
    resources :reviews, only: [ :index, :new, :create ]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
