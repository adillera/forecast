class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.integer :category_id
      t.string :item
      t.decimal :amount
      t.string :repeat
      t.string :flow
      t.date :single_occurrence

      t.timestamps
    end
  end
end
