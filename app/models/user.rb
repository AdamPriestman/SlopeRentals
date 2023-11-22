class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :location, presence: true
  has_many :listings, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_one_attached :photo
  # has_many :photos
end
