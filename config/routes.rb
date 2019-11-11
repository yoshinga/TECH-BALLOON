Rails.application.routes.draw do
  devise_for :users
  root  to: 'posts#search'
  resources :users, only: :show
  resources :posts, except: :index do
    collection do 
      get 'search'
    end
  end
end
