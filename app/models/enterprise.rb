class Enterprise < ApplicationRecord
  belongs_to :user
  has_many :services
  has_many :slots
  has_many :reviews
end
