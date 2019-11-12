Rails.application.routes.draw do
  devise_for :users
  root  to: 'posts#index'
  resources :users, only: :show
  resources :posts, except: :index do
    resources :comments, only: :index
    collection do 
      get 'search'
    end
  end
end
