import React, { Component } from 'react'
import request from 'superagent'
import Page from './Page'
import LinkedButton from './LinkedButton'
import Button from './Button'

class CampaignPage extends Component {
  constructor(props) {
    super(props)

    this.state = {
      name: '',
      scenarios: [],
      investigators: []
    }
  }

  componentDidMount() {
    const url = this.props.match.url

    request
      .get(url)
      .then((res) => {
        const name = res.body.data.name
        const scenarios = res.body.data.scenarios
        const investigators = res.body.data.investigators

        this.setState({ name, scenarios, investigators })
      })
  }

  renderScenarios() {
    return this.state.scenarios.map((scenario) => {
      return <li key={scenario.id}>{scenario.name}</li>
    })
  }

  renderInvestigators() {
    return this.state.investigators.map((investigators) => {
      return <li>{investigators.name}</li>
    })
  }

  render() {
    return (
      <Page>
        <div className="row">
          <div className="col-xs-6">
            <LinkedButton path="/api/campaigns" label="Back" icon="close" />
          </div>
          <div className="row">
            <div className="col-xs-6 text-center">
              <Button label="Add Investigator" icon="plus" />
            </div>
          </div>
          <div className="col-xs-5">
            <div className="thumbnail">
              <span>{this.state.name}</span>
              <ul>
                {this.renderScenarios()}
              </ul>
            </div>
          </div>
          <div className="col-xs-7">
            <ul>
              {this.renderInvestigators()}
            </ul>
          </div>
        </div>
      </Page>
    )
  }
}

export default CampaignPage