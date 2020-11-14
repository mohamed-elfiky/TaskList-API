Rails.application.routes.draw do
  post '/authenticate/login', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tlists

end
