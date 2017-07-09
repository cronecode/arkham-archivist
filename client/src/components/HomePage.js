import React, { Component } from 'react'
import ReactModal from 'react-modal'
import Page from './Page'
import Button from './Button'
import NewCampaignForm from './NewCampaignForm'
import daisy from '../images/daisy.jpg'

class HomePage extends Component {
  constructor() {
    super ()

    this.state = { modalIsOpen: false }

    this.openModal = this.openModal.bind(this)
    this.closeModal = this.closeModal.bind(this)
  }

  openModal() {
    this.setState({ modalIsOpen: true })
  }

  closeModal() {
    this.setState({ modalIsOpen: false })
  }

  newCampaign() {

  }

  render() {
    return (
      <Page>
        <div className="row text-center">
          <ReactModal className="modal-sm" isOpen={this.state.modalIsOpen} onRequestClose={this.closeModal}>
            <NewCampaignForm closeModal={this.closeModal} newCampaign={this.newCampaign} />
          </ReactModal>
        </div>
        <div className="row">
          <div className="col-xs-12 text-center centered-image">
            <img src={daisy} alt="Daisy Walker" className="text-center" />
          </div>
        </div>
        <div className="row">
          <div className="col-xs-12 col-sm-6 text-center">
            <Button label="View Campaigns" icon="eye" />
          </div>
          <div className="col-xs-12 col-sm-6 text-center">
            <Button label="New Campaign" icon="plus" onClick={this.openModal}/>
          </div>
        </div>
      </Page>
    )
  }
}

export default HomePage