class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :customers, through: :reservations

  validates :name, presence: true


  def availability(party_size, time)
     current_capacity(time) - party_size
  end

  def time_range(restaurant)
    form_time_range = []
    time_option = restaurant.open_time
    while time_option < restaurant.closing_time
      form_time_range << time_option
      time_option = time_option+1.hour
    end
    form_time_range
  end

  def time_range_show(form_time)
    form_time.map {|time| time.strftime("%l:%M%p") }
  end

  private
  def current_capacity(time)
    if self.reservations.empty?
      capacity
    else
      capacity - reserved_capacity(time)
    end
  end

  def reserved_capacity(time)
    self.reservations.where(time: time.beginning_of_hour..time.end_of_hour).sum(:party_size)
  end
end
