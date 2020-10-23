class User < ActiveRecord::Base
    has_many :bets
    has_secure_password
end