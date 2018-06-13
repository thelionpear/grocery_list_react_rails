class CreateGroceries < ActiveRecord::Migration[5.2]
  def change
    create_table :groceries do |t|
      t.string :name
      t.string :categoy
      t.boolean :purchased

      t.timestamps
    end
  end
end
