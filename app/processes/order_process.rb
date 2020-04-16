# frozen_string_literal: true

class OrderProcess < ApplicationProcess
  def call(event)
    message = event.data.fetch(:message)
    publish(message)
  end
end
