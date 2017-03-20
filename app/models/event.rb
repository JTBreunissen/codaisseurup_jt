class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  def bargain?
    price < 30
  end

  def self.order_by_price
    order(:price)
  end

  scope :alphabetical, -> {order(name: :asc)}
  scope :published, -> {where(active: true)}

  def self.during(arrival, departure)
    arrival = arrival.change(hour: 14, min:00, sec:00)
    departure = departure.change(hour: 11, min:00, sec:00)

    starts_before_ends_after(arrival, departure)
    .or(ends_during(arrival, departure))
    .or(starts_during(arrival, departure))
  end

  def self.booked_during(arrival, departure)
    during(arrival, departure).pluck(:id)
  end

  def self.available_during(arrival, departure)
    where.not(id: Event.booked_during(arrival, departure))
  end

  def self.starts_before_ends_after(arrival, departure)
    where('starts_at < ? AND ends_at > ?', arrival, departure)
  end

  def self.starts_during(arrival, departure)
    where('starts_at > ? AND starts_at < ?', arrival, departure)
  end

  def self.ends_during(arrival, departure)
    where('end_at > ? AND ends_at < ?', arrival, departure)
  end

end
