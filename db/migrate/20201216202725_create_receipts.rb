class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer    :point,  null: false
      t.string     :reason, null: false
      t.references :wallet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
