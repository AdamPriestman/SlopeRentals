class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @listings = Listing.search_by_name_and_description(params[:query])
    else
      @listings = Listing.all
    end
    # Geocoding on index for test
    @listings = Listing.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude
      }
    end

  end

  def show
    @listing = Listing.find(params[:id])
    @offer = Offer.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  private

  def listing_params
    params.require(:listing).permit(
      :name,
      :equipment_type,
      :price_per_day,
      :size,
      :condition,
      :brand,
      :gender,
      :description,
      photos: []
    )
  end
end
