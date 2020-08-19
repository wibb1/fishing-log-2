import React from 'react'
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import RecordsIndexContainer from '../containers/RecordsIndexContainer';

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/records/react" component={RecordsIndexContainer}/>
      </Switch>
    </BrowserRouter>
  )
}

export default App
