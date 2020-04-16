# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def publish(event)
    Rails.configuration.event_store.publish(event, stream_name: 'nats-demo')
  end
end
