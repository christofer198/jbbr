Rails.application.routes.draw do
  get 'openings/show'

  get 'openings/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :employers
  resources :openings
end
