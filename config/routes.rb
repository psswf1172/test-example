Rails.application.routes.draw do
  root 'toppings#index'
  resources :toppings, only: [:index, :show]
  resources :ice_creams, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
