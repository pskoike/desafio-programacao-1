Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sales#index'
  resources :sales

  post '/upload', to: 'sales#upload'


end
