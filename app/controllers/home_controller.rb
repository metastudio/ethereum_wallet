require_relative '../services/node_api/eth'

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @balance = get_balance(@user.wallet)
  end

  private

  def get_balance(wallet)
    balance = Services::NodeApi::Eth.new.get_balance(wallet)
    formatter = Ethereum::Formatter.new
    formatter.from_wei(balance.to_i(16))
  end
end
