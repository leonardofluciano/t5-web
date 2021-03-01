class CreateSubsidiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :subsidiaries do |t|
      t.string :name, limit: 191
      t.string :legal_name, limit: 191
      t.string :document, limit: 13
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
