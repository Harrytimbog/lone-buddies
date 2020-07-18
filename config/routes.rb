Rails.application.routes.draw do
  devise_for :users
  root to: 'buddies#index'
  get "buddies/my_own", to: "buddies#my_own", as: :my_own

  get 'user/dashboards#show', to: "user/dashboards#show", as: :my_profile

  resources :users, only: [:show]
  resources :buddies do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
