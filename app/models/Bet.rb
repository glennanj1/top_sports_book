class Bet < ActiveRecord::Base
    belongs_to :user

    validates :team, :date, presence: true
end