class User < ApplicationRecord

    has_secure_password 

    has_many :ideas, dependent: :destroy 
    has_many :reviews, dependent: :destroy

    VALID_EMAIL_REGEX = /\A([\w+\-],?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

    def full_name
        "#{first_name} #{last_name}"
    end
end