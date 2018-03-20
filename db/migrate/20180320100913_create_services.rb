class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.integer :delay

      t.timestamps
    end
  end
end
