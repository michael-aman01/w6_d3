class User < ApplicationRecord
    validates presence: true, uniqueness: true 
end
