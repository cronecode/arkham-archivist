import React from 'react';
import ReactDOM from 'react-dom';
import CampaignIndexContainer from './components/CampaignIndexContainer'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import { createBrowserHistory } from 'history'
import HomePage from './components/HomePage'
import NewCampaignForm from './components/NewCampaignForm'
import './styles/index.css'
import 'font-awesome/css/font-awesome.css'

var history = createBrowserHistory()

ReactDOM.render(
<Router history={history}>
  <Switch>
  <Route exact path="/" component={HomePage} />
  <Route path="/api/campaigns" component={CampaignIndexContainer} />
  </Switch>
  </Router>
  , document.getElementById('root'))