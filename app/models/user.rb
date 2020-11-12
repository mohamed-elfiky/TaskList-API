class User < ApplicationRecord
    has_secure_password
    validates :username, :password_digest, presence:true
    has_many :tlists , foreign_key :owner , dependent: :destroy
end
