import React from 'react';
import { shallow } from 'enzyme';
import Message from './Message';

describe('Message', () => {
  it('should render', () => {
    const rendered = shallow(<Message text="Mock" />);
    expect(rendered).toMatchSnapshot()
  })
})
