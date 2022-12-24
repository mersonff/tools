# frozen_string_literal: true

Rails.application.routes.draw do
  resources :places
  get 'pages/home', to: 'home#index'
end
