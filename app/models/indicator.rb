# frozen_string_literal: true

# Indicator class model for which one we will create graphs on "mechanism"
class Indicator < ApplicationRecord
  belongs_to :mechanism
  serialize :values, Array
  before_create :add_first_value

  private

  def add_first_value
    values << rand(0..10)
  end
end
