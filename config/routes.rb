Rails.application.routes.draw do
  root 'sessions#new'

  get '/home', to: 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :subjects do
    resources :exams
  end

end
