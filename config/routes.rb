# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    resources :places
    resources :tools
  end
  root to: 'application#index'
  get '*path', to: 'application#index', format: false
end
