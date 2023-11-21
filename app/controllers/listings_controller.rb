class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @listings = Listing.all
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
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :equipment_type, :price_per_day, :size, :condition, :brand, :gender)
  end
end
