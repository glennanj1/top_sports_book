User.destroy_all
Bet.destroy_all

10.times do 
    User.create!(username: Faker::Name.name, password_digest: BCrypt::Password.create('1234'))
end

10.times do 
    Bet.create!(amount: rand(100), team: Faker::Sports::Football.team, date: "Today", user: User.offset(rand(10)).first)
end