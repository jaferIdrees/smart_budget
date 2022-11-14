class CreateGroupsDevelopersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :purchases do |t|
      t.references :groups, null: false, foreign_key: true
      t.references :purchases, null: true, foreign_key: true
    end
  end
end
