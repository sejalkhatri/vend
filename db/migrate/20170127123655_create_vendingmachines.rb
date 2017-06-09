class CreateVendingmachines < ActiveRecord::Migration[5.0]
  def change
    create_table :vendingmachines do |t|
      t.string :place
      t.integer :productid
      t.integer :stock

      t.timestamps
    end
  end
end
