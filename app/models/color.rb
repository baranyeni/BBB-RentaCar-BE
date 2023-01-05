class Color < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :hex, uniqueness: true, presence: true
end
