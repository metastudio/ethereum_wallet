# frozen_string_literal: true

require_relative '../services/node_api/personal'
require_relative '../services/node_api/eth'

module Operations
  class SendTransaction
    include Services::NodeApi

    def initialize(from, to, amount, password)
      @from = from
      @to = to
      @amount = amount
      @password = password
    end

    def call
      personal = Personal.new
      eth = Eth.new
      personal.unlock_account(@from, @password)
      eth.send_transaction({
        from: @from,
        to: @to,
        value: @amount
      })
    end
  end
end
