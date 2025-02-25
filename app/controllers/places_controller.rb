class PlacesController < ApplicationController
  def index
    @places = Place.all  # Ensures @places is always available for index.html.erb
  end

  def show
    @place = Place.find(params[:id])  # Finds the place by ID
    @entries = @place.entries         # Fetches all associated entries
  end

  def new
    @place = Place.new  # Initializes an empty place object for the form
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place) # Redirects to the newly created place
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
