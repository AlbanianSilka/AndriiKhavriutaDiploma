class Indicator < ApplicationRecord
  belongs_to :mechanism
  before_create :generate_values

  private

  def generate_values
    self.values = Array.new(10) { rand(1..10) }
  end
end
