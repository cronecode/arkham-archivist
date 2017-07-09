import React, { Component } from 'react'
import FormField from './FormField'
import Dropdown from './Dropdown'
import Button from './Button'

class NewCampaignForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      cycle: '',
      name: ''
    }

    this.handleInputChange = this.handleInputChange.bind(this)
    this.onSubmit = this.onSubmit.bind(this)
  }

  handleInputChange(e) {
    const target = e.target
    const value = target.value
    const name = target.name

    this.setState({
      [name]: value
    })
  }

  onSubmit() {
    fetch('/api/campaigns', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        credentials: 'include'
      },
      data: {
        cycle: this.state.cycle,
        name: this.state.name
      }
    })
  }

  render() {
    const options = [
      {
        value: 1,
        label: 'Night of the Zealot'
      },
      {
        value: 2,
        label: 'The Dunwich Legacy'
      }
    ]
    return (
      <div>
        <div className="row">
          <Dropdown label="Cycle:" options={options} />
        </div>
        <div className="row">
          <FormField name="name" label="Name:" onChange={this.handleInputChange} />
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