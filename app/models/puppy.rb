class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :favorites
    has_many :users, -> { select(:user_id) }, class_name: 'Favorite', :foreign_key  => :puppy_id 
    

    def average_rating
       reviews = Review.where(puppy_id: id).average(:rating)
       if reviews
        return reviews.round(2)
       end
    end

    def user_favorite
        Favorite.where(puppy_id: id)
    end
end
