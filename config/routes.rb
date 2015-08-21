Rails.application.routes.draw do
  root "subs#index"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts do
    member do
      post "upvote"
      post "downvote"
    end
    resources :comments, except: :index do
      member do
        post "upvote"
        post "downvote"
      end
    end
  end
end
