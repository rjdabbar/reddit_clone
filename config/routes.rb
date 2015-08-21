Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:index, :new, :create]
  end
  resources :posts, except: [:index, :new, :create]
end
