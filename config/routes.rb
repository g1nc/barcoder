Rails.application.routes.draw do

  devise_scope :user do
    get    'register' => 'devise/registrations#new'
    get    'login'    => 'devise/sessions#new'
    get    'profile'  => 'devise/registrations#edit'
    delete 'logout'   => 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  authenticated :user do
    root :to => 'dashboard#index'
  end

  resources :contacts, :notifications, :topics, :events

  scope 'api', as: 'api', defaults: {format: :json} do
    post 'contacts', to: 'api#contact', via: :post
  end

  match 'contact', as: 'static_contact', to: 'pages#contact', via: :get
  match 'about',   as: 'static_about',   to: 'pages#about',   via: :get

  root :to => 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
