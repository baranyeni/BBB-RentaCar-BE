class Brand < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :logo_url, presence: true
end
