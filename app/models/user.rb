class User < ApplicationRecord
    has_many :todos
    validates :username, :email, presence: true, uniqueness: true
end
