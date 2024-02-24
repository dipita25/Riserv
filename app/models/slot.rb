class Slot < ApplicationRecord
  enum :status, [ :free, :booked ]
  belongs_to :enterprise
  has_many :reservations, dependent: :destroy
end
