class Car < ApplicationRecord
  has_many :pictures, dependent: :destroy, class_name: 'CarPicture'
  has_many :rentals, dependent: :destroy
  belongs_to :brand
  belongs_to :color
  belongs_to :location

  validates :plate_number, presence: true, uniqueness: true

  def unavailable_dates
    rentals
      .where('start_date >= ?', Date.today)
      .map { |rental| { start_date: rental.start_date, end_date: rental.end_date } }
  end
end
