import React from 'react';
import { connect } from 'react-redux';

import { send } from '../../modules/messages';
import { changeMessage } from '../../modules/chats';
import Page from '../../components/Page/Page';
import ChatHeading from '../../components/ChatHeading/ChatHeading';
import MessagesPanel from '../../components/MessagesPanel/MessagesPanel';
import Message from '../../components/Message/Message';
import ChatActions from '../../components/ChatActions/ChatActions';
import Room from '../../components/Room/Room';

const Chat = ({
  messages,
  handleSend,
  handleMessageTyping,
  message
}) => (
  <Page>
    <ChatHeading title="Chat" />
    <Room>
      <MessagesPanel>
        {
          messages.map(({text, id, loading}) => (
            <Message text={loading ? 'loading...' : text} key={id} />
          ))
        }
      </MessagesPanel>
      <ChatActions 
        onSubmitMessage={handleSend} 
        onMessageTyping={handleMessageTyping}
        message={message}
      />
    </Room>
  </Page>
)

const mapStateToProps = (state) => {
  return {
    messages: Object.values(state.messages),
    message: state.chats.message
  }
}

const mapDispatchToProps = (dispatch) => ({
  handleSend: (payload) => dispatch(send(payload)),
  handleMessageTyping: (payload) => dispatch(changeMessage(payload))
})

export default connect(mapStateToProps, mapDispatchToProps)(Chat);
