Rails.application.routes.draw do

  get 'lawyers_request/index'
  get 'lawyers_request/my_list' => 'lawyers_request#my_list' 
  post '/finished' => 'lawyers_request#finished' 
  post '/accept' => 'lawyers_request#accept'

  get 'welcome/index'
  root 'welcome#index'

  resources :requests

  devise_for :users
  devise_for :lawyers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
