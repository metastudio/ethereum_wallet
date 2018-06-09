class CreateWithdrows < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrows do |t|
      t.string :to
      t.float :amount, default: 0
      t.string :hex
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
