Rails.application.routes.draw do
  root 'dashboard/urls#new'

  namespace :dashboard do # app routes, to separate from api/admin
    resources :urls, only: [:show, :new, :create]
  end
end
