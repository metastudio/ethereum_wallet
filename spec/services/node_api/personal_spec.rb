# frozen_string_literal: true

require 'rails_helper'

describe Services::NodeApi::Personal do
  subject { Services::NodeApi::Personal.new }

  describe 'new_account' do
    it 'create wallet in node' do
      expect(subject.new_account('foo')).to eq(12)
    end
  end

  describe 'list_accounts' do
    it 'return list of accounts' do
      expect(subject.list_accounts).to eq(12)
    end
  end
end
