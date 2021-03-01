User.destroy_all
Bet.destroy_all

50.times do 
    User.create!(username: Faker::Name.name, password_digest: BCrypt::Password.create('1234'))
end

50.times do 
    Bet.create!(amount: rand(1000), team: Faker::Sports::Basketball.team, date: Faker::Date.between(from: '2021-02-19', to: '2021-02-21'), user: User.offset(rand(10)).first)
end