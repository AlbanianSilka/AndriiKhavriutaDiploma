# frozen_string_literal: true

# Mechanism model (our main class)
class Mechanism < ApplicationRecord
  has_one_attached :mechanism_image
  has_many :indicators
  before_destroy :destroy_indicators

  private

  def destroy_indicators
    indicators.destroy_all
  end
end
