import React, { Component } from 'react'
import { Link } from 'react-router-dom'

const CampaignIndex = ({ campaigns }) => {
  const index = campaigns.map((campaign) => {
    const path = '/api/campaigns/' + campaign.id
    return <li><Link to={path} key={campaign.id}>{campaign.name}</Link></li>
  })

  return (
    <div className="container-fluid">
      <div className="row">
        <div className="col-xs-6">
          <div className="thumbnail space-above space-below">
            <ul>
              {index}
            </ul>
          </div>
        </div>
      </div>
    </div>
  )
}

export default CampaignIndex