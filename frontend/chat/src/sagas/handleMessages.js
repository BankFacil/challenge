import { takeEvery, put, call, select } from 'redux-saga/effects'
import { ADD_MESSAGE, startSending, doneSending, onFail } from '../modules/messages'
import { changeMessage } from '../modules/chats'
import SendLocal from '../service/local';
import uuid from 'uuid';

const delay = (ms) => new Promise(res => setTimeout(res, ms))

function* newMessageSaga() {
  const {chats} = yield select()
  const message = { text: chats.message, id: uuid(), room: null }
  try {
    yield put(startSending(message))
    const payload = yield call(SendLocal, message)
    yield delay(250)
    yield put(doneSending(payload))
    yield put(changeMessage(''))
  } catch (e){
    yield put(onFail())
  }
}

const handleMessages = function* handleMessage() {
  yield takeEvery(ADD_MESSAGE, newMessageSaga)
}

export default handleMessages
