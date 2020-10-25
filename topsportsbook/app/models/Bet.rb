class Bet < ActiveRecord::Base
    belongs_to :user

    validates :team, :amount, :date, presence: true
end