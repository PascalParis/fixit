class CreateWorkorders < ActiveRecord::Migration[5.1]
  def change
    create_table :workorders do |t|
      t.date :date
      t.references :provider, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
