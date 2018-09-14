class AddAssesorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :assesor, :boolean
  end
end
