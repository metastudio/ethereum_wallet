# frozen_string_literal: true

require_relative '../operations/send_transaction'

class Deposit < ApplicationRecord
  belongs_to :user

  validates :from, presence: true
  validates :amount, presence: true
  validate :from_is_address

  before_create :send_transaction

  private

  def from_is_address
    formatter = Ethereum::Formatter.new
    message = 'must be an Ethereum address'
    errors.add(:from, message) unless formatter.valid_address?(from)
  end

  def send_transaction
    password = User.where(wallet: from).first.email
    self.hex = Operations::SendTransaction.new(
      from,
      user.wallet,
      amount,
      password
    ).call
  end
end
