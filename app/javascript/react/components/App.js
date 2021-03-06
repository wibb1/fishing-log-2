import React from 'react'
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import RecordsIndexContainer from '../containers/RecordsIndexContainer';
import RecordShowContainer from '../containers/RecordShowContainer';

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/records/react" component={RecordsIndexContainer}/>
        <Route exact path="/records/react/:id" component={RecordShowContainer}/>
      </Switch>
    </BrowserRouter>
  )
} 

export default App
