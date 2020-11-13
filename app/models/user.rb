class User < ApplicationRecord
    has_secure_password
    validates :password_digest, presence:true
    validates :username, presence: true, uniqueness: true
    has_many :tlists , foreign_key: :owner , dependent: :destroy
end
