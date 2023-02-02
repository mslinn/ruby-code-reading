require 'rom'
require 'rom-sql'
require 'rom-repository'

# This example sets up an in-memory SQLite database and adds one record to it.
# The record is back and a record field is displayed.
rom = ROM.container(:sql, 'sqlite::memory') do |conf|
  conf.default.create_table(:users) do
    primary_key :id
    column :name, String, null: false
    column :email, String, null: false
  end
end

class UserRepo < ROM::Repository[:users]
  commands :create

  def by_id(id)
    users.where(id: id).one
  end
end

# Yields Uncaught exception: :users doesn't exist in ROM::RelationRegistry registry
user_repo = UserRepo.new(rom)

user_repo.create(name: 'Jane', email: 'jane@doe.org')

puts user_repo.by_id(1).name
