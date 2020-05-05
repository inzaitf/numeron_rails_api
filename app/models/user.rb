class User < ApplicationRecord

    has_secure_token
    #validate
    validates :name, presence: true, uniqueness: true, length: {in: 3..255}

    validates :password, presence: true, length: {in: 3..255}
end
