import React from 'react';
import ReactDOM from 'react-dom';
import CampaignIndexContainer from './components/CampaignIndexContainer'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import { createBrowserHistory } from 'history'
import HomePage from './components/HomePage'
import CampaignPage from './components/CampaignPage'
import NewCampaignForm from './components/NewCampaignForm'
import './styles/index.css'
import 'font-awesome/css/font-awesome.css'

var history = createBrowserHistory()

ReactDOM.render(
<Router history={history}>
  <div>
    <Route exact path="/" component={HomePage} />
    <Route exact path="/api/campaigns" component={CampaignIndexContainer} />
    <Route path="/api/campaigns/:id" component={CampaignPage} />
  </div>
</Router>, document.getElementById('root'))