Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, path: "auth",
  controllers: { sessions: "auth/sessions", registrations: "auth/registrations", passwords: "auth/passwords" },
  path_names: {
    sign_in: "login",
    sign_up: "cmon_let_me_in",
    sign_out: "logout",
    password: "secret",
    confirmation: "verification",
    unlock: "unblock",
    registration: "register"
  }

  devise_scope :user do
    root to: "auth/sessions#new"
  end

  get "/home", to: "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/about", to: "static_pages#about"

  resources :users
  post "/deactivate", to: "users#deactivate"
  post "/activate", to: "users#activate"

  resources :subjects do
    resources :exams do
      get "failed_save", to: "exam#failed_save"
      get "failed_update", to: "exam#failed_update"
      resources :answers, only: [:new, :update, :show, :edit]
    end
  end

  get "/history", to: "answers#index"
end
