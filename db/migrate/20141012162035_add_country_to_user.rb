class AddCountryToUser < ActiveRecord::Migration
  def change
    add_column :users, :country_id, :string
  end
end
