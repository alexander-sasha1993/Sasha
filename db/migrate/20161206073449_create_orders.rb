class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :datepublic
      t.date :dateperformance
      t.float :costdelivery
      t.integer :client_id
      t.integer :delivery_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
