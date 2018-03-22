class CreateProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :mobile
      t.string :title
      t.string :work_email
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
