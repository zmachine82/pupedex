class User < ApplicationRecord
    validates :email, uniqueness: true
    has_many :reviews
    has_secure_password
    
    def generate_token!
        update_attribute :token, AccessToken.new(self).generate
    end

    def profile
        {
            id: id,
            first_name: first_name,
            last_name: last_name,
            nickname: nickname,
            token: token,
            image: image,
            email: email
        }
    end

end
