Rails.application.routes.draw do

  get 'dashboard/index'
  get 'dashboard/contacts'
  get 'dashboard/settings'
  get 'dashboard/notification'

  devise_for :users do
    get 'register' => 'devise/registrations#new'
    get 'login'    => 'devise/sessions#new'
    get 'profile'  => 'devise/registrations#edit'
  end
  authenticated :user do
    root :to => 'dashboard#index'
  end

  scope 'api', as: 'api', defaults: {format: :json} do
    post 'contacts', to: 'api#contact', via: [:post]
  end

  match 'contact', to: 'pages#contact', via: [:get]
  match 'about',   to: 'pages#about',   via: [:get]

  root :to => 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
