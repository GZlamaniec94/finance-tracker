Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'welcome#index'
  get 'my_account', to: 'users#my_account'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'users#search'
  get 'my_friends', to: 'users#my_friends'
  resources :friendships, only: [:create, :destroy]

end
