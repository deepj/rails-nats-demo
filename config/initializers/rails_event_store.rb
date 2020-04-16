# frozen_string_literal: true

require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new(
    request_metadata: ->(env) do
      request = ActionDispatch::Request.new(env)
      session_id = request.session['session_id']
      user_id    = request.session['warden.user.user.key']&.first&.first

      {
        remote_ip:  request.remote_ip,
        request_id: request.uuid,
        web_session_id: session_id,
        current_user_id: user_id
      }
    end
  )

  command_bus     = Arkency::CommandBus.new
  register        = command_bus.method(:register)

  Rails.configuration.command_bus = command_bus

  Rails.configuration.event_store.tap do |store|
    store.subscribe(OrderProcess,   to: [OrderCreated])
  end
end
