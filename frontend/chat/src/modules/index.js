import { combineReducers } from 'redux'
import messages from './messages'
import chats from './chats'

export default combineReducers({
  messages,
  chats,
})
