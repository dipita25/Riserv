class Slot < ApplicationRecord
  enum :status, [ :free, :booked ]
  belongs_to :enterprise
  has_many :reservations, dependent: :destroy

  validate :start_time_after_last_end_time_same_day
  validate :start_time_before_end_time
  validate :minimum_slot_duration

  private

  def start_time_after_last_end_time_same_day
    if Slot.where("DATE(start_time) = ?", start_time.to_date)
           .where("end_time > ?", start_time)
           .exists?
      errors.add(:start_time, "doit être après la fin du dernier créneau du même jour")
    end
  end

  def start_time_before_end_time
    if start_time >= end_time
      errors.add(:start_time, "l'heure de début ne peut être supérieure ou égale à l'heure de fin")
    end
  end

  def minimum_slot_duration
    if (end_time - start_time) < 30.minutes
      errors.add(:base, "Slot must be at least 30 minutes long")
    end
  end

end
