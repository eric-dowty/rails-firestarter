users = [ {email: 'default@user.com', password: 'password', role: 0},
          {email: 'admin@user.com', password: 'password', role: 1}
        ]

users.each { |user_data| User.create!(user_data) }

puts 'users created'