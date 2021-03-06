class Comment < ActiveRecord::Base
  belongs_to :church


  RATINGS = {
      'One Star'    => '1_star',
      'Two Stars'   => '2_stars',
      'Three Stars' => '3_stars',
      'Four Stars'  => '4_stars',
      'Five Stars'  => '5_stars'
    }

    def humanized_rating
      RATINGS.invert[self.rating]
    end

end
