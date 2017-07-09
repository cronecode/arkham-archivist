import React, {Component} from 'react'
import CampaignIndex from './CampaignIndex'

class CampaignIndexContainer extends Component {
  constructor(props) {
    super(props)

    this.state = {campaigns: [] }
  }

  componentDidMount() {
    fetch('/api/campaigns')
      .then((response) => {
        return response.json() })
      .then((campaigns) => {
        this.setState({ campaigns })
      })
  }

  render() {
    return (
      <CampaignIndex campaigns={this.state.campaigns} />
    )
  }
}

export default CampaignIndexContainer