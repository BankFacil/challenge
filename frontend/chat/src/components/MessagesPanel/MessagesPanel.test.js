import React from 'react';
import { shallow } from 'enzyme';
import MessagesPanel from './MessagesPanel';

describe('MessagesPanel', () => {
  it('should render with a base class', () => {
    const rendered = shallow(<MessagesPanel />);
    expect(rendered.find('.base')).toHaveLength(1);
  })
  it('should has a UL', () => {
    const rendered = shallow(<MessagesPanel />);
    expect(rendered.find('ul')).toHaveLength(1);
  })
})
