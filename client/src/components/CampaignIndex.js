import React, {Component} from 'react'
import IndexRow from './IndexRow'

class CampaignIndex extends Component {
  render() {
    var list = []
    this.props.campaigns.forEach((campaign) => {
      list.push(<IndexRow name={campaign.name} id={campaign.id} key={campaign.id} />)
    })
    return (
      <div className="container-fluid">
        <div className="row">
          <div className="col-xs-6">
            <div className="thumbnail space-above space-below">
              <ul>
                {list}
              </ul>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default CampaignIndex