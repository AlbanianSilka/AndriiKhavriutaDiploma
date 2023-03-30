class IndicatorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "indicator_#{params[:indicator_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
