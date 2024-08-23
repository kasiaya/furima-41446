class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,             null: false
      t.text :item_description,        null: false
      t.integer :price,   null: false
      t.references :user, null: false, foreign_key: true
      t.integer :category_id,          null: false
      t.integer :condition_id,         null: false
      t.integer :delivery_payer_id,    null: false
      t.integer :delivery_area_id,     null: false
      t.integer :lead_time_id,         null: false
      t.timestamps
    end
  end
end
