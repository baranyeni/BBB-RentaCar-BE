class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user

  before_validation :calculate_price

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
  validates_comparison_of :start_date, greater_than: Date.today
  validates_comparison_of :end_date, greater_than: :start_date

  validate :no_rental_overlap
  private

  def no_rental_overlap
    if Rental.where(car_id: car_id).where('start_date <= ? AND end_date >= ?', end_date, start_date).any?
      errors.add(:rentals, 'Car is already booked for this period.')
    end
  end

  def calculate_price
    return if start_date.blank? || end_date.blank?

    days = (end_date.to_date - start_date.to_date).to_i
    self.price = days < 30 ? days * car.price_per_day : days * (car.price_per_month / 30)
  end
end
