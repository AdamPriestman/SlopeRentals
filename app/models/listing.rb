class Listing < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :photo
  validates :name, :price_per_day, :equipment_type, :photo, presence: true
end
