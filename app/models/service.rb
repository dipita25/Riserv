class Service < ApplicationRecord
  belongs_to :enterprise
  has_one_attached :photo
end
