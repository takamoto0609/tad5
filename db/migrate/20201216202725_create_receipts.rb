class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer    :gift_id, null: false
      t.integer    :point,   null: false
      t.string     :name,    null: false
      t.string     :address, null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
