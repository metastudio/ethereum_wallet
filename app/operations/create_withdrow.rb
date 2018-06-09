# frozen_string_literal: true

module Operations
  # create withdrow operation
  class CreateWithdrow
    def initialize(params)
      @to = params[:to]
      @amount = params[:amount]
      @user = params[:user]
    end

    def call
      withdrow = Withdrow.new(
        to: @to,
        amount: @amount,
        user: @user
      )
      withdrow.save ? [:ok, 'Withdrow was created'] : [:error, withdrow]
    end
  end
end
