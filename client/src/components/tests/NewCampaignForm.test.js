import React from 'react'
import { shallow } from 'enzyme'
import NewCampaignForm from '../NewCampaignForm'
import Dropdown from '../Dropdown'
import FormField from '../FormField'

describe('NewCampaignForm', () => {
  it('always renders a div', () => {
    const wrapper = shallow(<NewCampaignForm />)
    const divs = wrapper.find('div')

    expect(divs.length).toBeGreaterThanOrEqual(1)
  })
})

describe('the rendered div', () => {
  it('contains everything else that gets rendered', () => {
    const wrapper = shallow(<NewCampaignForm />)
    const divs = wrapper.find('div')
    const outer = divs.first()

    expect(outer.containsAllMatchingElements([
      <Dropdown label="Cycle:" />,
      <FormField label="Name:"/>,
    ])).toEqual(true)
  })
})