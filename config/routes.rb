Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'welcome#index'
  get 'my_account', to: 'users#my_account'
  get 'search_stock', to: 'stocks#search'
end
