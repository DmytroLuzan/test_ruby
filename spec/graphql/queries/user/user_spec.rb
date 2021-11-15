require 'rails_helper'

module Query
  module User
    RSpec.describe User, type: :request do
      describe '.resolve' do
        it 'get user name and repos' do
          login = "user"

          post '/graphql', params: { query: query(login: login) }
          json = JSON.parse(response.body)
          data = json['data']['user']
          puts data
          expect(data).to include(
            'name' => be_present,
            'repos' => be_present # add array check
          )
        end
      end

      def query(login:)
        <<~GQL
          query {
              user(login: "#{login}") {
                  name
                  repos
              }
          }
        GQL
      end
    end
  end
end
