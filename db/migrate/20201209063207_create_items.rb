class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # 要検討！！
      t.integer    :wash_power_id
      t.integer    :status_id,     null: false
      t.text       :address,       null: false
      t.integer    :point,         null: false
      t.text       :comment,       null: false
      t.references :user,          null: false, foreign_key: true
      t.float      :latitude
      t.float      :longitude
      t.timestamps
    end
  end
end
