class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :document
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
