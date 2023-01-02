class Car < ApplicationRecord
  has_many :pictures, dependent: :destroy, class_name: 'CarPicture'

  validates :plate_number, presence: true, uniqueness: true
end
