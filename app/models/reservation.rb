class Reservation < ActiveRecord::Base

  validates_with ReservationValidator

  belongs_to :customer
  belongs_to :restaurant

  validates :date, presence: true
  validates :time, presence: true
  validates :phone, presence: true
  validates :party_size, presence: true
  validates :party_size, numericality:{ only_integer: true}
  validate :capacity_available

  def capacity_available
    if self.party_size
      if self.restaurant.availability(self.party_size, self.time) < 0
        errors.add(:party_size, "(Sorry, we can't accommodate a party of this size at this time)")
      end
    end
  end


end
