Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'comments/new'
  devise_for :users
  root  to: 'posts#index'
  resources :users, only: :show do
    member do
      get :likes
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :posts, except: :index do
    resources :comments, only: [:new, :create, :edit, :update]
    collection do 
      get 'search'
    end
  end
end
