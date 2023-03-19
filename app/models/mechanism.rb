class Mechanism < ApplicationRecord
  has_one_attached :mechanism_image
  has_many :indicators
end
