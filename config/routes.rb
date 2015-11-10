Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :requests
  end
  resources :users do
    resources :tests
  end
  resources :problems
end
