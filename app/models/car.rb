class Car < ApplicationRecord
  has_many :pictures, dependent: :destroy, class_name: 'CarPicture'
  has_many :rentals, dependent: :destroy
  belongs_to :brand
  belongs_to :color
  belongs_to :location

  validates :plate_number, presence: true, uniqueness: true
  validates :description, presence: true
  validates :availability, presence: true, inclusion: { in: %w[available unavailable] }
  validates :fuel_type, presence: true, inclusion: { in: %w[diesel gasoline electric hybrid] }
  validates :gear_type, presence: true, inclusion: { in: %w[manual automatic] }
  validates :brand, presence: true
  validates :color, presence: true
  validates :location, presence: true
  validates :kilometer, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :model, presence: true
  validates :model_year, presence: true, numericality: { greater_than_or_equal_to: 1990 }
  validates :price_per_day, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price_per_month, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def unavailable_dates
    rentals
      .where('start_date >= ?', Date.today)
      .map { |rental| { start_date: rental.start_date, end_date: rental.end_date } }
  end
end
