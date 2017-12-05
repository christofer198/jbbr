Rails.application.routes.draw do
  get 'openings/show'

  get 'openings/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :employers, :openings

  get '/users/:id', to: 'users#show', as: '/dashboard'
  get '/users/:id/resume/new', to: 'resumes#new'
  get '/users/:id/resume/edit', to: 'resumes#edit'
  post "/users/:id/resume/edit", to: 'resumes#update'
  post "/users/:id/resume/new", to: 'resumes#create'

end
