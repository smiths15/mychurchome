class Church < ActiveRecord::Base
geocoded_by :address
validates :name, :address, :description, :weblink, presence: true, length: {minimum: 3} 
end
