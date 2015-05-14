class Seed

  def self.start
    new.generate
  end

  def generate
    create_users
    create_items
    create_statuses
  end

  def create_users
    users.each { |user_data| User.create!(user_data) }
    puts 'users created'
  end

  def users
    [ {email: 'default@user.com', password: 'password', role: 0},
      {email: 'admin@user.com', password: 'password', role: 1}
    ]
  end

  def create_items
    items.each { |item_data| Item.create!(item_data) }
    puts 'items created'
  end

  def items
    [ {title: 'sample item', description: 'lots of goodies', price: 150},
      {title: 'another item', description: 'seed does not use default image', price: 275, image: File.open('app/assets/images/goodies.jpg')}
    ]
  end

  def create_statuses
    statuses.each { |status| Status.create!(status) }
    puts 'statuses created'
  end

  def statuses
    [ {name: 'ordered'}, {name: 'paid'}, {name: 'cancelled'}, {name: 'complete'} ]
  end

end

Seed.start

