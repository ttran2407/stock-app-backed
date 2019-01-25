Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :transactions
    resources :watchlists
    resources :ownedstocks
  end
  post '/login', to: 'auth#create'
  get '/current_user', to: 'auth#show'

  resources :stocks, only:[:index, :show]
  resources :statuses, only:[:index, :show]
end
