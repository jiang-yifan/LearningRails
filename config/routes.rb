Rails.application.routes.draw do
  resource :user do
    get 'activate', on: :member
  end

  resource :session

  resources :bands

  resources :albums, except: [:index]

  resources :tracks, except: [:index] do
    resources :notes, only: [:new, :create]
  end

  resources :notes, except: [:index, :new, :create]

  root to: "session#new"
end
