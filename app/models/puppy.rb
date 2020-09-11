class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
