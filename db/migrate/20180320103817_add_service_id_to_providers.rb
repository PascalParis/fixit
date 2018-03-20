class AddServiceIdToProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :service_id, :integer
  end
end
