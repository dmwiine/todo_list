class User < ApplicationRecord
    has_many :todos
    validates_presence_of :username, :email 
end
