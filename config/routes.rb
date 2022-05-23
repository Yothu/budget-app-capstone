Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  devise_scope :user do
    authenticated do
      root to: 'categories#index', as: 'authenticated_user_root'
    end

    unauthenticated do
      root to: 'menus#index', as: 'unauthenticated_user_root'
    end
    
    get '/auth/logout', to: 'devise/sessions#destroy'
  end

  resources :categories, only: %i[index show new create]
end
