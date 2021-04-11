import React from 'react';
import { shallow } from 'enzyme';
import Page from './Page';

describe('Page', () => {
  it('should render', () => {
    const rendered = shallow(<Page />);
    expect(rendered).toMatchSnapshot()
  })
})
