# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    resources :places
  end
  root to: 'home#index'
  get '/', to: 'home#index'
  match "/*path", to: "home#index", format: false, via: :get
end
