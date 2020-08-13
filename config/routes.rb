Rails.application.routes.draw do
  resources :events do 
  # resources :rsvps do
   #  collection :attend
  # end
  end
  
  
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'events/:id/attend', to: 'rsvps#attend', as: 'attend_event'
  get 'events/:id/unattend', to: 'rsvps#unattend', as: 'unattend_event'
  
  get '/admin', to: 'users#admin', as: 'admin_dashboard'
  post '/permissions', to: 'users#change_permission', as: 'change_permission'
  
  resources :users, only: [:show, :edit, :update]
  root to: "pages#home"
end