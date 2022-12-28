# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render template: 'tools/index'
  end
end
