# frozen_string_literal: true

require_relative '../operations/send_transaction'

class Withdrow < ApplicationRecord
  belongs_to :user

  validates :to, presence: true
  validates :amount, presence: true
  validate :to_is_address

  before_create :send_transaction

  private

  def to_is_address
    formatter = Ethereum::Formatter.new
    message = 'must be an Ethereum address'
    errors.add(:to, message) unless formatter.valid_address?(to)
  end

  def send_transaction
    password = user.email
    self.hex = Operations::SendTransaction.new(
      user.wallet,
      to,
      amount,
      password
    ).call
  end
end
