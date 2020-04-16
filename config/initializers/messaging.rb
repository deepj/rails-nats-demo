# frozen_string_literal: true

require 'messaging'
require 'messaging/client'

Messaging::Configuration.set_config(Rails.application.config_for(:messaging))
