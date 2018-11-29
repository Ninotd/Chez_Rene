Rails.application.routes.draw do
  devise_for :users
  root to: 'guns#topguns'

  resources :guns do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [ :index, :new, :create ]
    end
    collection do
      get '/mon-profil', to: "guns#mygun", as: :monprofil
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
