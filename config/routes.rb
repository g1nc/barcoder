Rails.application.routes.draw do

  devise_for :users, :skip => :registration

  match 'contact', to: 'pages#contact', via: [:get]
  match 'about',   to: 'pages#about',   via: [:get]

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
