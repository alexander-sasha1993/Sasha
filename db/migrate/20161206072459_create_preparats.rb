class CreatePreparats < ActiveRecord::Migration[5.0]
  def change
    create_table :preparats do |t|
      t.string :name
      t.float :cost
      t.date :dateofmanufacturer
      t.integer :shelflife
      t.text :description
      t.integer :manufacturer_id
      t.integer :type_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
