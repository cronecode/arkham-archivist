import React, { Component } from 'react'
import request from 'superagent'
import ReactModal from 'react-modal'
import Page from './Page'
import LinkedButton from './LinkedButton'
import Button from './Button'
import NewInvestigatorForm from './NewInvestigatorForm'
import InvestigatorDisplay from './InvestigatorDisplay'

String.prototype.toCamel = function () {
  return this.replace(/(_[a-zA-Z])/g, function ($1) {
    return $1.toUpperCase().replace('_', '')
  })
}

function withCamelCaseKeys(obj) {
  const newObjectWithCamelCaseKeys = {}
  for (const key of Object.keys(obj)) {
    if (obj[key] !== null && typeof obj[key] === 'object') {
      newObjectWithCamelCaseKeys[key.toCamel()] = withCamelCaseKeys(obj[key])
    } else {
      newObjectWithCamelCaseKeys[key.toCamel()] = obj[key]
    }
  }
  return newObjectWithCamelCaseKeys
}

class CampaignPage extends Component {
  constructor(props) {
    super(props)

    this.state = {
      name: '',
      scenarios: [],
      investigators: [],
      modalIsOpen: false
    }

    this.renderScenarios = this.renderScenarios.bind(this)
    this.openModal = this.openModal.bind(this)
    this.closeModal = this.closeModal.bind(this)
  }

  componentDidMount() {
    const url = this.props.match.url

    request
      .get(url)
      .then((res) => {
        const name = res.body.data.name
        const scenarios = res.body.data.scenarios
        const investigators = res.body.data.investigators.map((investigator) => {
          return withCamelCaseKeys(investigator)
        })
        this.setState({ name, scenarios, investigators })
      })
  }

  renderScenarios() {
    return this.state.scenarios.map((scenario) => {
      return <li key={scenario.id}>{scenario.name}</li>
    })
  }

  openModal() {
    this.setState({ modalIsOpen: true })
  }

  closeModal() {
    this.setState({ modalIsOpen: false })
  }

  render() {
    return (
      <Page>
        <ReactModal className="content modal-dialog" isOpen={this.state.modalIsOpen} onRequestClose={this.closeModal}>
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title">New Investigator</h5>
            </div>
            <div className="modal-body">
              <NewInvestigatorForm investigators={this.state.investigators} />
            </div>
            <div className="modal-footer">
              <Button onClick={this.closeModal} label="Cancel" icon="trash" />
              <Button onClick={this.closeModal} label="Save" icon="plus" />
            </div>
          </div>
        </ReactModal>
        <div className="row">
          <div className="col-xs-6">
            <LinkedButton path="/api/campaigns" label="Back" icon="close" />
          </div>
          <div className="row">
            <div className="col-xs-6 text-center">
              <Button onClick={this.openModal} label="Add Investigator" icon="plus" />
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
            <InvestigatorDisplay investigators={this.state.investigators} />
          </div>
        </div>
      </Page>
    )
  }
}

export default CampaignPage