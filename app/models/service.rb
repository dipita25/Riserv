class Service < ApplicationRecord
  belongs_to :enterprise
  has_many :reservations, dependent: :destroy
  has_one_attached :photo
end
