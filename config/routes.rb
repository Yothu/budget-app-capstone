Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'menus#index'

  devise_scope :user do
    get '/auth/logout', to: 'users/sessions#destroy'
  end

  # root "articles#index"
end
