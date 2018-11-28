Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :guns do
    collection do
      get '/mon-profil', to: "guns#mygun", as: :monprofil
    end
  end

  resources :bookings do
    resources :reviews, only: [ :index, :new, :create ]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
