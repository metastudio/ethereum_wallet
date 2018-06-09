class AddWalletToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wallet, :string
    add_column :users, :wallet_password, :string
  end
end
