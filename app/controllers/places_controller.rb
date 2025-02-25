class PlacesController < ApplicationController
  def index
    @places = Place.all # Fetches all places for the view
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries # Fetch entries for the selected place
  end
end
