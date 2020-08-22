
import React from 'react'
import { render } from 'react-dom'

import App from '../react/components/components/App'
import RedBox from 'redbox-react'

document.addEventListener('DOMContentLoaded', () => {
  let reactElement = document.getElementById('app')

  if (reactElement) {
    if(window.railsEnv && window.railsEnv === 'development'){
      try {
        render(<App />, reactElement)
      } catch (e) {
        render(<RedBox error={e} />, reactElement)
      }
    }
    else {
      render(<App />, reactElement)
    }
  }

	const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll(`.navbar-burger`), 0);

	if ($navbarBurgers.length > 0) {
		$navbarBurgers.forEach((element) => {
			element.addEventListener(`click`, () => {
				const target = element.dataset.target;
				const $target = document.getElementById(target);
				element.classList.toggle(`is-active`);
				$target.classList.toggle(`is-active`);
			});
		});
  }

})