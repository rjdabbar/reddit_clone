Rails.application.routes.draw do
  root "subs#index"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:index, :new, :create]
  end
  resources :posts, except: [:index, :new, :create]
end
