class Venue < ActiveRecord::Base
  belongs_to :city
  belongs_to :region
  belongs_to :country

  geocoded_by :full_location

  before_validation :geocode
  before_save :add_to_location

  attr_accessor :location

  def location
    loc = []
    loc << city.name if city.present?
    loc << region.name if region.present?
    loc << country.name if country.present?
    loc.join(", ")
  end

private

  def full_location
    logger.debug "Geocoding #{self.street_address}, #{@location}"
    "#{self.street_address}, #{@location}"
  end

  def add_to_location
    loc = @location.split(", ")
    logger.debug loc
    
    cit = City.find_or_create_by_name(loc[0])
    reg = Region.find_or_create_by_name(loc[1])
    cnt = Country.find_or_create_by_name(loc[2])

    reg.cities << cit
    cnt.regions << reg

    self.region_id = reg.id
    self.country_id = cnt.id
    self.city_id = cit.id
  end
end
