module Types
  class UserType < Types::BaseObject
    field :name, String, null: false
    field :repos, [String], null: true
  end
end
