Rails3Base::Application.routes.draw do
  resources :users, :only => [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :posts
  resources :friendships,   :only => [:create, :destroy]

  devise_for :users,
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  as :user do
    get 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
    get 'logout', :to => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'
    get 'edit', :to => 'devise/registrations#edit', :as => 'edit_user_registration'
  end

  root :to => 'home#index'
end
