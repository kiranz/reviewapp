Rails.application.routes.draw do
  root 'hotels#index'
  
  resources :sessions
  resources :hotels do
    resources :comments
  end

  resources :users
  post 'hotels/search',   to: 'hotels#search'
  get  'login',          to: 'sessions#new', as: 'login'
  post 'login',          to: 'sessions#create'
  get  'logout',         to: 'sessions#destroy', as: 'logout'
end
