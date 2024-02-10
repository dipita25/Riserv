class Reservation < ApplicationRecord
  belongs_to :service
  belongs_to :slot
  belongs_to :user
end
