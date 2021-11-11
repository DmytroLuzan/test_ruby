import graphql from 'graphql.js'
import { getToken } from './utils.js'

export const gql = graphql('http://localhost:3000/graphql', {
  method: 'POST', // POST by default.
  headers: {
    'X-CSRF-Token': getToken(), // need for BE side
  },
});
