class CreateVmDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :vm_details do |t|
      t.references :vendingmachine, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
