require 'net/http'

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :user, UserType, null: false do
      description "Returns a user and repos"
      argument :login, String, required: true
    end
    
    def user(login:)
      uri = URI("http://api.github.com/users/")
      res = Net::HTTP.get_response(uri)
      return res.body
      return {name: "Test", repos: ['first', 'second']}
    end
  end
end
