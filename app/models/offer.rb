class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
end
