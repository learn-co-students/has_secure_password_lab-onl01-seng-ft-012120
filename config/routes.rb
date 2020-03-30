Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  post '/logout', to: 'sessions#destroy'  

    get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/home', to: 'users#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
