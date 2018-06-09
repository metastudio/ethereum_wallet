# frozen_string_literal: true

module Operations
  # create deposit operation
  class CreateDeposit
    def initialize(params)
      @from = params[:from]
      @amount = params[:amount]
      @user = params[:user]
    end

    def call
      deposit = Deposit.new(
        from: @from,
        amount: @amount,
        user: @user
      )
      deposit.save ? [:ok, 'Deposit was created'] : [:error, deposit]
    end
  end
end
