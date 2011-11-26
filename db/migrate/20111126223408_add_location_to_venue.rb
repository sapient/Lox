class AddLocationToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :country_id, :integer
    add_column :venues, :region_id, :integer
    add_column :venues, :city_id, :integer
  end
end
