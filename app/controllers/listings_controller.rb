class ListingsController < ApplicationController
  # belongs_to :user
  # has_many :offers

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :equipment_type, :location, :price_per_day, :size, :condition, :brand, :gender)
  end
end
