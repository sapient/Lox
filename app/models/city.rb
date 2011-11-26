class City < ActiveRecord::Base
  belongs_to :region
  belongs_to :country
end
