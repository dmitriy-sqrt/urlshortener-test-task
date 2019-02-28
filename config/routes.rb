Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :dashboard do # app routes, to separate from api/admin
    resources :urls, only: [:show, :create]
  end
end
