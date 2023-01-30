class Api::Admin::AdminController < Api::ApiController

  def search_params
    if params[:q] != ''
      params[:q] ||= {}
    end
  end

end