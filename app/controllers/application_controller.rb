# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    render template: 'home/index'
  end

  def search_params
    return unless params[:q] != ''

    params[:q] ||= {}
  end
end
