class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :stock_quantity
      t.text :description

      t.timestamps
    end
  end
end
