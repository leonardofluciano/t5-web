class CreateSubsidiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :subsidiaries do |t|
      t.string :name
      t.string :legal_name
      t.string :document
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
