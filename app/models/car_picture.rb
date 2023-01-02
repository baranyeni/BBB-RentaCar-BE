class CarPicture < ApplicationRecord
  belongs_to :car
  validates :url, presence: true
end
