# frozen_string_literal: true

require 'rails_helper'

describe Services::NodeApi::Eth do
  let(:money_wallet) { '0xe288ace4c3cde046ebfd83557f652de131d4cd28' }
  let(:to_wallet) { '0xeceb7c607bbfa005aff0ccfbafbe62b8fe642138' }
  let(:amount) { 0.0001 }
  let(:personal) { Services::NodeApi::Personal.new }
  subject { Services::NodeApi::Eth.new }

  describe 'send_transaction' do
    it 'return hash of transaction' do
      params = {
        from: money_wallet,
        to: to_wallet,
        value: amount
      }
      personal.unlock_account(money_wallet, 'some password you dont know it')
      expect(subject.send_transaction(params)).to eq(12)
    end
  end
end
