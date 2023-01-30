# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    render template: 'admin'
  end
end
