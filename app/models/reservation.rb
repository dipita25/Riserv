class Reservation < ApplicationRecord
  belongs_to :service
  belongs_to :slot
  belongs_to :user

   # Validation pour vérifier l'unicité des dates de début et de fin
  #  validate :check_unique_datetime

  #  private

  # def check_unique_datetime
  #   if Reservation.exists?(start_time: start_time, end_time: end_time)
  #     errors.add(:base, "Une réservation avec les mêmes dates existe déjà")
  #   end
  # end
end
