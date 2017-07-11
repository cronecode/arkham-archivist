import React, { Component } from 'react'
import Dropdown from './Dropdown'
import FormField from './FormField'
import Button from './Button'
import request from 'superagent'

class NewCampaignForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      cycle: 'Night of the Zealot',
      name: ''
    }

    this.handleInputChange = this.handleInputChange.bind(this)
    this.onSubmit = this.onSubmit.bind(this)
  }

  handleInputChange(e) {
    const name = e.target.name
    const value = e.target.value

    this.setState({
      [name]: value
    })
  }

  onSubmit() {
    const name = this.state.name
    const cycle = this.state.cycle

    request
      .post('/api/campaigns')
      .send({ name, cycle })
      .end(() => {
        window.location = '/api/campaigns'
      })
  }

  render() {
    const options = [
      {
        key: 1,
        value: 'Night of the Zealot'
      },
      {
        key: 2,
        value: 'The Dunwich Legacy'
      }
    ]

    return (
      <div>
        <div className="row">
          <Dropdown label="Cycle:" name="cycle" options={options} onChange={this.handleInputChange} />
        </div>
        <div className="row">
          <FormField label="Name:" name="name" onChange={this.handleInputChange} />
        </div>
        <div className="row">
          <div className="col-xs-6 pull-left">
            <Button onClick={this.props.closeModal} label="Cancel" icon="trash" />
          </div>
          <div className="col-xs-6 pull-right">
            <Button onClick={this.onSubmit} label="Save" icon="bolt" />
          </div>
        </div>
      </div>
    )
  }
}

export default NewCampaignForm