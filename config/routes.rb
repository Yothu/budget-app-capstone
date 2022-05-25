Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  devise_scope :user do
    authenticated do
      root to: 'groups#index', as: 'user'
    end

    unauthenticated do
      root to: 'menus#index', as: 'unauthenticated_user_root'
    end
    
    get '/auth/logout', to: 'devise/sessions#destroy'
  end

  resources :groups, only: %i[index new create] do
    resources :deals, only: %i[index new create]
  end
end
