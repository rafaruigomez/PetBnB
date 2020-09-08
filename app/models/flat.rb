class Flat < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :address, presence: true

  has_many_attached :photos

end
