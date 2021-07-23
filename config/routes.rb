Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only: [:index, :create]
  end
  resources :tags, only: [:new, :create] do
    collection do
      get 'search'
    end
  end
end