class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than_or_equal_to: :start_date }
  validate :start_date_in_future, unless: -> { start_date.nil? }

  private

  def start_date_in_future
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
