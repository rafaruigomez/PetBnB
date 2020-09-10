class Reservation < ApplicationRecord
  validates :status, inclusion: { in: ["pending", "approved", "rejected"]}

  belongs_to :flat
  belongs_to :user
end
