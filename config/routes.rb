Rails.application.routes.draw do
  devise_for :users
  root to: 'guns#topguns'

  resources :guns do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [ :index, :new, :create ]
    end
  end
  get '/mon-profil', to: "guns#monprofil", as: :monprofil

  resources :bookings, only: [] do
    resources :booking_reviews, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
