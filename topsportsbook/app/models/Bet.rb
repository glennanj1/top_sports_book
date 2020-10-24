class Bet < ActiveRecord::Base
    has_many :users

    has_secure_password
end