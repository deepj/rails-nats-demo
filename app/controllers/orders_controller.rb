# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    message = 'Hello there!'
    publish(OrderCreated.new(data: { message: message }))

    render inline: message
  end
end
