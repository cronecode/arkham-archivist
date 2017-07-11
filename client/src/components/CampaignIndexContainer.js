import React, {Component} from 'react'
import request from 'superagent'
import { Link } from 'react-router-dom'
import Page from './Page'
import CampaignIndex from './CampaignIndex'

class CampaignIndexContainer extends Component {
  constructor(props) {
    super(props)

    this.state = {campaigns: [] }
  }

  componentDidMount() {
    request
      .get('/api/campaigns')
      .then((res) => {
        this.setState({ campaigns: res.body })
      })
  }

  render() {
    const campaigns = this.state.campaigns

    return (
      <Page>
        <CampaignIndex campaigns={campaigns} />
      </Page>
    )
  }
}

export default CampaignIndexContainer