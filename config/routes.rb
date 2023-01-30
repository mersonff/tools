# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api, :defaults => { :format => 'json' } do
    namespace :admin do
      resources :places
      resources :tools
    end
  end
  get '/admin', to: 'admin#index'
  match "/admin/*path", to: "admin#index", format: false, via: :get
end
