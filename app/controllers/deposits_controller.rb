# frozen_string_literal: true

require_relative '../operations/create_deposit'

class DepositsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deposits = current_user.deposits
  end

  def create
    operation_params = deposit_params(params)
    operation_params[:user] = current_user
    result = Operations::CreateDeposit.new(operation_params).call
    case result.first
    when :ok
      flash[:notice] = result.last
      redirect_to deposits_path
    when :error
      @deposit = result.last
      render :new
    end
  end

  def new
    @deposit = Deposit.new
  end

  private

  def deposit_params(params)
    params.require(:deposit).permit(:from, :amount)
  end
end
