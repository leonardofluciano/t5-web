Rails.application.routes.draw do
  root to: 'pages#home'

  resources :accounts
  resources :customers
  resources :subsidiaries
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
