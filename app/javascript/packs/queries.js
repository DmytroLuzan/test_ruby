import { gql } from './graphql';

export const getUser = gql(`
query GetUser($login: String!) {
    user(login: $login) {
        name
        repos
    }
}`);
