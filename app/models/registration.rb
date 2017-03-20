class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_save :set_status, :set_total_price

  def set_status
    event.price > 0 ? self.status = "pending" : self.status = "confirmed"
  end

  def set_total_price
    self.price = event.price * guests_count
  end

  def self.starts_before_ends_after(arrival, departure)

  end

  def self.starts_during(arrival, departure)
  end

  def self.ends_during(arrival, departure)
  end
end
