import React from 'react';
import { shallow } from 'enzyme';
import Room from './Room';

describe('Room', () => {
  it('should render', () => {
    const rendered = shallow(<Room />);
    expect(rendered).toMatchSnapshot()
  })
})
