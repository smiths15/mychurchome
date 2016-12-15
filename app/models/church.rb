class Church < ActiveRecord::Base
has_many :comments

geocoded_by :address
after_validation :geocode 
validates :name, :address, :description, presence: true, length: {minimum: 3} 
end
