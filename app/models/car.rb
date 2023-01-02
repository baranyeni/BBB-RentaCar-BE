class Car < ApplicationRecord
  has_many :pictures, dependent: :destroy, class_name: 'CarPicture'
  belongs_to :brand
  belongs_to :color
  belongs_to :location

  validates :plate_number, presence: true, uniqueness: true
end
