# frozen_string_literal: true

module Services
  module NodeApi
    class Personal
      def initialize
        @client = Ethereum::HttpClient.new('http://localhost:8545')
        @formatter = Ethereum::Formatter.new
      end

      def new_account(password)
        response = @client.personal_new_account(password)
        response['result']
      end

      def list_accounts
        response = @client.personal_list_accounts
        response['result']
      end

      def unlock_account(wallet, password)
        uri = URI.parse('http://localhost:8545')
        request = Net::HTTP::Post.new(uri)
        request.content_type = 'application/json'
        request.body = JSON.dump({
          method: 'personal_unlockAccount',
          params: [
            wallet,
            password,
            12
          ],
          id: 1,
          jsonrpc: '2.0'
        })
        req_options = {
          use_ssl: uri.scheme == 'https',
        }
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
        response.body
      end
    end
  end
end
