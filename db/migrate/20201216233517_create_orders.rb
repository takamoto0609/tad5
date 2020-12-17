class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer    :point,  null: false
      t.integer    :status, null: false, default: 0
      t.integer    :taker,  null: false
      t.integer    :giver,  null: false
      t.references :item,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
