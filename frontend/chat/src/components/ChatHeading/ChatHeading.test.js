import React from 'react';
import { shallow } from 'enzyme';
import ChatHeading from './ChatHeading';

describe('ChatHeading', () => {
  it('should render', () => {
    const rendered = shallow(<ChatHeading title="Mock" />);
    expect(rendered).toMatchSnapshot()
  })
})
