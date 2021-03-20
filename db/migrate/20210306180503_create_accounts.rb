class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :number
      t.float :balance
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
