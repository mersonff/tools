# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render template: 'application'
  end

  def search_params
    return unless params[:q] != ''

    params[:q] ||= {}
  end
end
