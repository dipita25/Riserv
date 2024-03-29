class Enterprise < ApplicationRecord
  belongs_to :user
  has_many :services, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
