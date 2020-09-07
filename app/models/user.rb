class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_flats, foreign_key: "user_id" , class_name: "Flat"

  has_many :reservations

  has_many :booked_flats, source: :flat, through: :reservations
end
