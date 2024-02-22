class Slot < ApplicationRecord
  enum :status, [ :free, :booked ]
  belongs_to :business
end
