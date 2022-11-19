class RemovePurchseFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_reference :groups, :purchase, null: false, foreign_key: true
  end
end
