class PlacesController < ApplicationController
  def index
    @places = Place.includes(:entries).all  # Ensure entries are preloaded for efficiency
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries  # Fetch associated entries
  end

  def new
    @place = Place.new
    @place.entries.build  # Ensure at least one entry can be added when creating a place
  end

  def create
    @place = Place.new(place_params)
    
    if @place.save
      redirect_to places_path, notice: "Place and entries created successfully!"
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, entries_attributes: [:title, :content])
  end
end
