Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pt-BR/ do
    devise_for :users,
    :controllers => {
      registrations:  "users/registrations",
      confirmations:  "users/confirmations",
      sessions:       "users/sessions",
      passwords:      "users/passwords",
    }, :path_names => {:sign_in => "login", :sign_out => "logout"}, skip: :omniauth_callbacks
  end

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :bills

  resources :language do
    post :set_pt, :on => :collection
    post :set_en, :on => :collection
  end

  root to: 'home#index', locale: /en|pt-BR/
end
