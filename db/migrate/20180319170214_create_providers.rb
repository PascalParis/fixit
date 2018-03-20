class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.text :presentation
      t.integer :range
      t.string :photo

      t.timestamps
    end
  end
end
