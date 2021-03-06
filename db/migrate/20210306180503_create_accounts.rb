class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :number, limit: 191
      t.float :balance
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
