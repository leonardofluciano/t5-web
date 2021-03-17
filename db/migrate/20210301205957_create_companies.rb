class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :legal_name
      t.string :document

      t.timestamps
    end
  end
end
