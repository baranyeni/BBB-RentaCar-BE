class Color < ApplicationRecord
  validates :name, uniqueness: true
  validates :hex, uniqueness: true
end
