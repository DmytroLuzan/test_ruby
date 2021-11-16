require 'rails_helper'

module Query
  module User
    RSpec.describe User, type: :request do
      describe '.resolve' do
        let(:data) do
          VCR.use_cassette('users', record: :new_episodes) do
            login = 'dhh'
            post '/graphql', params: { query: query(login: login) }
            json = JSON.parse(response.body)
            json['data']['user']
          end
        end

        it 'get user object' do
          expect(data).to be_kind_of(Hash)
        end

        it 'user object has name' do
          expect(data).to have_key('name')
          expect(data['name']).to be_kind_of(String)
        end

        it 'user object has repos' do
          expect(data).to have_key('repos')
          expect(data['repos']).to be_kind_of(Array)
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
