module Types
  class QueryType < Types::BaseObject
    API_URL = "https://api.github.com/"
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
      # create URI's
      user_uri = URI.join(API_URL, "users/", login)
      repos_uri = URI.join(API_URL, "users/", "#{login}/", 'repos')

      # get user data
      user_response = Net::HTTP.get(user_uri)
      user = JSON.parse(user_response)

      # get repos data
      repos_response = Net::HTTP.get(repos_uri)
      repos = JSON.parse(repos_response)
      repos_list = repos.map {|repo| repo['name']}

      return {
        :name => user['name'],
        :repos => repos_list
      }
    end
  end
end
