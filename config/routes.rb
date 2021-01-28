Rails.application.routes.draw do
  devise_for :users
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
