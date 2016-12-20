class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :family
      t.string :name
      t.string :adress
      t.string :phone
      t.text :description
      t.integer :position_id

      t.timestamps
    end
  end
end
