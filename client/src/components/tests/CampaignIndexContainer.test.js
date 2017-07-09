import React from 'react'
import { expect } from 'chai'
import { shallow, mount } from 'enzyme'
import CampaignIndexContainer from '../CampaignIndexContainer'
import CampaignIndex from '../CampaignIndex'

describe('CampaignIndexContainer', () => {
  const wrapper = shallow(<CampaignIndexContainer/>)

  expect(wrapper.containsAllMatchingElements([
    <CampaignIndex/>
  ])).to.equal(true)
})