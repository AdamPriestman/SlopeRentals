class Listing < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
  validates :name, :price_per_day, :equipment_type, :photos, presence: true
end
