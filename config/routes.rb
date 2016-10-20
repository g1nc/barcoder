Rails.application.routes.draw do

  devise_scope :user do
    get    'register' => 'devise/registrations#new'
    get    'login'    => 'devise/sessions#new'
    get    'profile'  => 'devise/registrations#edit'
    delete 'logout'   => 'devise/sessions#destroy'
  end

  devise_for :users
  authenticated :user do
    root :to => 'dashboard#index'
  end

  resources :contacts, :notifications, :topics, :events, :subscribe

  # API routes
  scope 'api', as: 'api', defaults: {format: :json} do
    match 'contacts',    to: 'api#contact',     via: :post
    match 'topics',      to: 'api#topics',      via: :get
    match 'events',      to: 'api#events',      via: :get
    # Contact subscribe/unsubscribe for topics
    match 'subscribe',   to: 'api#subscribe',   via: :post
    match 'unsubscribe', to: 'api#unsubscribe', via: :post
  end

  match 'contact', as: 'static_contact', to: 'pages#contact', via: :get
  match 'about',   as: 'static_about',   to: 'pages#about',   via: :get

  root :to => 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
