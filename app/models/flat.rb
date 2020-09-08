class Flat < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validate :price, presence: true
  validate :name, presence: true
  validate :description, presence: true
  validate :location, presence: true
  validate :address, presence: true

end
