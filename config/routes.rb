Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root  to: 'posts#index'
  resources :users, only: :show
  resources :posts, except: :index do
    resources :comments, only: [:new, :create, :edit, :update]
    collection do 
      get 'search'
    end
  end
end
