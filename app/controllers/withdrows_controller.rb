# frozen_string_literal: true

require_relative '../operations/create_withdrow'

class WithdrowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @withdrows = current_user.withdrows
  end

  def new
    @withdrow = Withdrow.new
  end

  def create
    operation_params = withdrow_params(params)
    operation_params[:user] = current_user
    result = Operations::CreateWithdrow.new(operation_params).call
    case result.first
    when :ok
      flash[:notice] = result.last
      redirect_to withdrows_path
    when :error
      @withdrow = result.last
      render :new
    end
  end

  private

  def withdrow_params(params)
    params.require(:withdrow).permit(:to, :amount)
  end
end
