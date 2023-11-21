class Listing < ApplicationRecord
  belongs_to :user
  has_many :offers
  validates :name, :price_per_day, :equipment_type, presence: true
end
