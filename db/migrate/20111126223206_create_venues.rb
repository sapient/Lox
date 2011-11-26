class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :notes
      t.string :street_address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
