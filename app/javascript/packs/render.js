const name = document.querySelector('#name');
const list = document.querySelector('#list');
const error = document.querySelector('#error');

const createReposList = (repos) =>
  repos.map((repo) => {
    const li = document.createElement('li');
    li.textContent = repo;
    return li;
  });

export const renderData = ({ user }) => {
  list.textContent = '';
  const reposList = createReposList(user.repos);
  list.append(...reposList);
  name.textContent = user.name;
  error.hidden = true;
};

export const renderError = (errors) => {
  name.textContent = '';
  list.textContent = '';
  error.textContent = errors[0] ? errors[0].message : 'Something went wrong...';
  error.hidden = false;
};
