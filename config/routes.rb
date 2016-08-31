Rails.application.routes.draw do
  resources :attachments
  resources :posts
  #devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}
  #Para la autenticación con twitter
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
