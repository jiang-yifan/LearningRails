Rails.application.routes.draw do
  resources :users
  resource :session, except: [:edit, :update, :show]
  resources :subs
  resources :posts, except: [:index, :destroy] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :new, :show]
end
