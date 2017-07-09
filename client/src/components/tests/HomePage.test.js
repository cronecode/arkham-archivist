import React from 'react'
import { mount } from 'enzyme'
import HomePage from '../HomePage'
import Page from '../Page'
import Button from '../Button'
import daisy from '../../images/daisy.jpg'

describe('HomePage', () => {
  let props;
  let mountedHomePage;
  const homePage = () => {
    if (!mountedHomePage) {
      mountedHomePage = mount(
        <HomePage {...props} />
      );
    }
    return mountedHomePage;
  }

  it('always renders a Page', () => {
    expect(homePage().find(Page).length).toEqual(1)
  })

  describe('the rendered Page', () => {
    it('contains everything else that gets rendered', () => {
      const page = homePage().find(Page)

      expect(page.children()).toEqual(homePage().children())

      expect(page.children()).containsAllMatchingElements([
        <img src={daisy} />
      ])
    })
  })
})

