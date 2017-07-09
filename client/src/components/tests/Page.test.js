import React from 'react'
import { shallow } from 'enzyme'
import Page from '../Page'
import Navbar from '../Navbar'

describe('Page', () => {
  it('always renders a div', () => {
    const wrapper = shallow(<Page />)
    const divs = wrapper.find('div')

    expect(divs.length).toBeGreaterThanOrEqual(1)
  })
})

describe('the rendered div', () => {
  it('contains everything else that gets rendered', () => {
    const wrapper = shallow(<Page />)
    const divs = wrapper.find('div')
    const outer = divs.first()

    expect(outer.containsAllMatchingElements([
      <Navbar />,
    ])).toEqual(true)
  })
})