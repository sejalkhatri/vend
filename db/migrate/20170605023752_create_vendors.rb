class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors,id:false do |t|
      t.references :vendingmachines, foreign_key: true
      t.string :password
      t.string :name, :primary_key => true
      t.timestamps
    end
  end
end
