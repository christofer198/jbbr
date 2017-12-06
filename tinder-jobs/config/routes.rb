Rails.application.routes.draw do
  get 'openings/show'

  get 'openings/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  resources :companies, :openings, :applications

  get '/profile', to: 'users#show'

  get '/logout', to: 'sessions#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/profile/resume/new', to: 'resumes#new'
  get '/profile/resume/edit', to: 'resumes#edit'
  post "/profile/resume/edit", to: 'resumes#update'
  post "/users/:id/resume/new", to: 'resumes#create'

end
