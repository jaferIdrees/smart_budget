class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :name
      t.decimal :amount
      t.references :author, null: false, foreign_key:  { to_table: :users }, index: true
      # t.references :group, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
