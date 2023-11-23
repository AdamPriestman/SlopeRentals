class Listing < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_many_attached :photos
  validates :name, :price_per_day, :equipment_type, presence: true
end
