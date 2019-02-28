Rails.application.routes.draw do
  root 'dashboard/links#new'

  namespace :dashboard do # app routes, to separate from api/admin
    resources :links, only: [:show, :new, :create], param: :uuid
    resources :stats, only: [:show], param: :secret
  end

  get "/:uuid", to: "links#show", as: 'short_link'
end
