class ReservationValidator < ActiveModel::Validator
  def validate(reservation)
    too_early = reservation.time < reservation.restaurant.open_time
    too_late = reservation.time > reservation.restaurant.closing_time
    reservation.errors[:open] << "The Restaurant is not open at this time" if too_early || too_late
  end
end
