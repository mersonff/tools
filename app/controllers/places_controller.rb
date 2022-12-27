# frozen_string_literal: true

class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  def new
    @place = Place.new
  end

  # GET /places
  # GET /places.json
  def index
    @places = Place
      .ransack(search_params)
      .result
      .order(:name)
      .page(params[:page])
      .per(params[:per_page])
  end

  # GET /places/1
  # GET /places/1.json
  def show; end

  def edit; end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    if @place.save
      render :edit, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    if @place.update(place_params)
      render :edit, status: :ok, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:name, :place_id)
  end
end
