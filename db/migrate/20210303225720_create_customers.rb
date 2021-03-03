class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, limit: 191
      t.string :surname, limit: 191
      t.string :document, limit: 11
      t.string :email, limit: 191
      t.string :phone, limit: 14

      t.timestamps
    end
  end
end
