# frozen_string_literal: true

require "#{Rails.root}/app/jobs/application_job"

# a background job to add random value with range from 0 to 10 for each indicator
class AddIndicatorValueJob < ApplicationJob
  queue_as :default

  def perform
    Thread.new do
      loop do
        indicators = Indicator.all

        indicators.each do |indicator|
          indicator.values << rand(0..10)
          indicator.save
          ActionCable.server.broadcast "indicator_#{indicator.id}",
                                       { value: indicator.values.last, indicator_id: indicator.id }
        end

        sleep 5
      end
    end
  end
end
