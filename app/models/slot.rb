class Slot < ApplicationRecord
  enum :status, [ :free, :booked ]
  belongs_to :enterprise
end
