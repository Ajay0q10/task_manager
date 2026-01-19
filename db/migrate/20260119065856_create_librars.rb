class CreateLibrars < ActiveRecord::Migration[8.1]
  def change
    create_table :librars do |t|
      t.string :name
      t.string :author
      t.integer :price

      t.timestamps
    end
  end
end
