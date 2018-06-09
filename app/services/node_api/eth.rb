# frozen_string_literal: true

module Services
  module NodeApi
    class Eth
      def initialize
        @client = Ethereum::HttpClient.new('http://localhost:8545')
        @formatter = Ethereum::Formatter.new
      end

      def get_balance(wallet)
        @client.eth_get_balance(wallet)['result']
      end

      def send_transaction(params)
        address = @formatter.to_address(params[:to])
        @client.eth_send_transaction(
          from: params[:from],
          to: address,
          value: @client.int_to_hex(@formatter.to_wei(params[:value].to_f))
        )['result']
      end
    end
  end
end
