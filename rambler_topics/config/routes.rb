Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :topics, constraints: { id: /\d+/ }
  get 'topics/*link', to: 'topics#show'
end
