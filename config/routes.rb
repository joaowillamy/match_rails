Rails.application.routes.draw do
  
  get 'welcome/index'
  root 'welcome#index'
  resources :requests
  
  devise_for :users
  devise_for :lawyers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
