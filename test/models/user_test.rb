require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#==" do
    users = []

    ActiveRecord::Base.connected_to(shard: :group1, role: :writing) do
      users << User.create(name: "Alice")
      users << User.create(name: "Bob")
    end

    ActiveRecord::Base.connected_to(shard: :group2, role: :writing) do
      users << User.create(name: "Charlie")
      users << User.create(name: "Dave")
      users << User.create(name: "Eve")
    end

    puts "unique users: #{users.uniq.pluck(:name)}"

    users.combination(2).each do |user, another|
      puts "#{user.name} #{user == another ? '==' : '!='} #{another.name}"
    end

    assert users.uniq.count == 5
  end
end
