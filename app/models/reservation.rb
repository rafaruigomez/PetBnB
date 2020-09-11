class Reservation < ApplicationRecord
  validates :status, inclusion: { in: ["pending", "approved", "rejected"]}
  validates :reservation_start, :reservation_end, presence: true

  belongs_to :flat
  belongs_to :user
end
