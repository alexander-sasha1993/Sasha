class CreateOrdereds < ActiveRecord::Migration[5.0]
  def change
    create_table :ordereds do |t|
      t.integer :order_id
      t.integer :preparat_id
      t.integer :quantity
      t.float   :discount
      t.timestamps
    end
  end
end
