import React, { Component } from 'react'
import request from 'superagent'
import Dropdown from './Dropdown'

class NewInvestigatorForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      investigators: [
        {name: 'Ashcan Pete'},
        {name: 'Agnes Baker'},
        {name: 'Daisy Walker'}
      ],
      remainingInvestigators: [],
      selected: ''}
    this.getRemainingInvestigators = this.getRemainingInvestigators.bind(this)
  }

  componentDidMount() {
    const remainingInvestigators = this.getRemainingInvestigators()
    this.setState({ remainingInvestigators })
  }

  getRemainingInvestigators() {
    const possibleInvestigators = [
      { key: 1, value: 'Ashcan Pete' },
      { key: 2, value: 'Agnes Baker' },
      { key: 3, value: 'Daisy Walker' },
      { key: 4, value: 'Jenny Barnes' },
      { key: 5, value: 'Jim Culver' },
      { key: 6, value: 'Rex Murphy' },
      { key: 7, value: 'Skids O\'Toole' },
      { key: 8, value: 'Wendy Adams' },
      { key: 9, value: 'Zoey Samaras'}
    ]

    const possibleInvestigatorNames = possibleInvestigators.map((investigator) => { return investigator.value })
    const existingInvestigatorNames = this.state.investigators.map((investigator) => { return investigator.name })

    return possibleInvestigatorNames.filter((name) => { return !existingInvestigatorNames.includes(name) })
  }

  handleSelect(e) {
    const name = e.target.value

    this.setState({ selected: name })
  }

  render() {
    const options = this.state.remainingInvestigators
    return (
      <div>
        <Dropdown label="Investigator:" name="name" options={options} onChange={this.handleSelect}></Dropdown>
      </div>
    )
  }
}

export default NewInvestigatorForm