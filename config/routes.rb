Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :requests
  end
  resources :problems do
    resources :tests
  end
end
