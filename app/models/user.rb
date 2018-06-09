# frozen_string_literal: true

require_relative '../services/node_api/personal'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deposits
  has_many :withdrows

  after_create :create_wallet

  private

  def create_wallet
    node = Services::NodeApi::Personal.new
    self.wallet = node.new_account(email)
    save
  end
end
