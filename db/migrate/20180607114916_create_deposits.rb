class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.string :from
      t.float :amount, default: 0
      t.string :hex
      t.integer :approval, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
