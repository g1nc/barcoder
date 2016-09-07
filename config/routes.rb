Rails.application.routes.draw do

  get 'dashboard/index'
  get 'dashboard/contacts'
  get 'dashboard/settings'
  get 'dashboard/notification'

  devise_for :users
  authenticated :user do
    root :to => 'dashboard#index'
  end

  scope 'api', as: 'api', defaults: {format: :json} do
    resources :contacts
  end

  match 'contact', to: 'pages#contact', via: [:get]
  match 'about',   to: 'pages#about',   via: [:get]

  root :to => 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
