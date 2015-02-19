Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy, :user_params] do
    resources :contacts, only: [:index] do
      member do
        get 'fav'
      end
    end
  end

  resources :contacts, only: [:show, :create, :destroy, :contact_params]
  resources :contact_shares, only: [:index, :show, :create, :destroy, :contact_shares_params]
  resources :comments
  # get 'users/:id' => 'users#show'
  # get 'users/' => 'users#index'
  # post 'users/' => 'users#create'
  # get 'users/:id' => 'users#show'
end
