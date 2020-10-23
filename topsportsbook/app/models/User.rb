class User < ActiveRecord::Base
    has_many :bets
end