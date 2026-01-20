class CreateVehicals < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicals do |t|
      t.string :company
      t.integer :model
      t.integer :price
      t.string :color

      t.timestamps
    end
  end
end
