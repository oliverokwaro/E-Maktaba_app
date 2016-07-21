Rails.application.routes.draw do
  #get 'session/new'

  root 'static_pages#home'
  get       'signup' => 'users#new'
  get       'contact' => 'static_pages#contact'
  get       'login' => 'session#new'
  post      'login' => 'session#create'
  delete    'logout' => 'session#destroy'
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
