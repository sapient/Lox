class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :region_id
      t.integer :country_id

      t.timestamps
    end
  end
end
