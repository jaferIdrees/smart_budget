class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :icon
      t.references :author, null: false, foreign_key:  { to_table: :users }, index: true
      t.references :purchase, null: true, foreign_key: true

      t.timestamps
    end
  end
end
