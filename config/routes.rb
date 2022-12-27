# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    resources :places
  end
  root :to => "application#index"
  match "*path", to: "application#index", format: false, via: :get
end
