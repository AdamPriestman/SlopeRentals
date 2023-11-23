class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @listings = Listing.all
  end

  def show
    @listing = set_listing
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
    @listing = set_listing
  end

  def update
    @listing = set_listing
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = set_listing
    @listing.destroy
    redirect_to offers_path(current_user)
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

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
