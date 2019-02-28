Rails.application.routes.draw do
  root 'dashboard/urls#new'

  namespace :dashboard do # app routes, to separate from api/admin
    resources :urls, only: [:show, :new, :create], param: :uuid
    resources :stats, only: [:show], param: :secret
  end

  get "/:uuid", to: "urls#show", as: 'short_url'
end
