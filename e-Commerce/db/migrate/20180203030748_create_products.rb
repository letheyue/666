class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.text :comment

      t.timestamps
    end
  end
end
