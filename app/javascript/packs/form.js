import { getUser } from './queries';
import { renderData, renderError } from './render';

const form = document.querySelector('form');
const query = document.querySelector('#query');

form.addEventListener('submit', (e) => {
  e.preventDefault(); // disable redirect to action path

  if (query.value) {
    getUser({ login: query.value }).then(renderData).catch(renderError);
  }
});
