class RenameName < ActiveRecord::Migration[5.1]
  def change
    remove_column :workorders, :date, :date
    add_column :workorders, :booking_date, :datetime
  end
end
