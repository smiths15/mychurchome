class Church < ActiveRecord::Base
has_many :comments, dependent: :destroy

geocoded_by :address
after_validation :geocode 
validates :name, :address, :description, presence: true, length: {minimum: 3} 

  def self.search(search)
    self.where("name ILIKE ? OR address ILIKE ? or description ILIKE ? or weblink ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
