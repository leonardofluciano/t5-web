class CreateJoinTableSubsidiariesCustomers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :subsidiaries, :customers do |t|
      t.index [:subsidiary_id, :customer_id]
    end
  end
end
