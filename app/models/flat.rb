class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :reservations
  has_many :reviews

  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :address, presence: true


  has_many_attached :photos

  def get_country
    address.match(/\s(\w+)$/)[0]
  end
end
