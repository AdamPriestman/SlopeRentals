class OffersController < ApplicationController
  before_action :set_listing, only: [:create]

  def create
    @offer = Offer.new(offer_params)
    @offer.listing = @listing
    @offer.user = current_user
    if @offer.save
      redirect_to offers_path(current_user)
    else
      render "listings/show", status: 422
    end
  end

  def index
    @user = current_user
    @outgoing_offers = @user.offers
  end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :end_date, :message)
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
