class User < ApplicationRecord
    has_many :todos
    validates :username, :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
