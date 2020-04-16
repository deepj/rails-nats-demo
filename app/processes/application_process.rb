# frozen_string_literal: true

class ApplicationProcess
  private def publish(message)
    messaging.publish('nats-demo', message)
  end

  private def messaging
    Messaging::Client.current
  end
end
