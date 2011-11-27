class City < ActiveRecord::Base
  belongs_to :region
  belongs_to :country
  geocoded_by :get_location
  before_validation :geocode

private
  def get_location
    loc = []
    loc << name
    loc << region.name
    loc << country.name
    loc.join(", ")
  end
end
