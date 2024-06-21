Rails.application.routes.draw do
  root "sessions#new"

  get "/home", to: "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/about", to: "static_pages#about"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users

  resources :subjects do
    resources :exams do
      get "failed_save", to: "exam#failed_save"
      get "failed_update", to: "exam#failed_update"
      resources :answers, only: [:new, :update, :show, :edit]
    end
  end

  get "/history", to: "answers#index"
end
