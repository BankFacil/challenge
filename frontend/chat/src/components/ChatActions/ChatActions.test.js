import React from 'react'
import { shallow } from 'enzyme'
import ChatActions from './ChatActions'

describe('chatActions', () => {
  it('should has a message field', () => {
    const wrapper = shallow(<ChatActions />);
    expect(wrapper.find('.textField')).toHaveLength(1);
  })
  it('should has a send button', () => {
    const wrapper = shallow(<ChatActions />);
    expect(wrapper.find('.sendBtn')).toHaveLength(1);
  })
  it('should send message when click button', () => {
    const sendFunc = jest.fn()
    const wrapper = shallow(
      <ChatActions onSubmitMessage={sendFunc} message="mock" />
    );
    wrapper.find('.sendBtn').simulate('click')
    expect(sendFunc).toHaveBeenCalled()
  })
  it('should not send empty message', () => {
    const sendFunc = jest.fn()
    const wrapper = shallow(
      <ChatActions onSubmitMessage={sendFunc} message="" />
    );
    wrapper.find('.sendBtn').simulate('click')
    expect(sendFunc).not.toHaveBeenCalled()
  })
  it('should send with enter key', () => {
    const sendFunc = jest.fn()
    const wrapper = shallow(
      <ChatActions onSubmitMessage={sendFunc} message="mock" />
    );
    wrapper.find('.textField').simulate('keypress', {key: 'Enter'})
    expect(sendFunc).toHaveBeenCalled()
  })
})
