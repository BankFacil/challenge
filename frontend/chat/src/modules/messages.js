export const ADD_MESSAGE = 'app/message/ADD_MESSAGE';
export const START_SENDING = 'app/message/START_SENDING';
export const SENDING_FAIL = 'app/message/SENDING_FAIL';
export const DONE_SENDING = 'app/message/DONE_SENDING';

export const startSending = ({id, text}) => ({ type: START_SENDING, id, text })

export const onFail = ({id, text}) => ({ type: SENDING_FAIL, id, text })

export const doneSending = ({id, text}) => ({ type: DONE_SENDING, id, text })

export const send = (payload) => ({ type: ADD_MESSAGE, payload })

const initialState = {
  'as123as': {
    id: 'as123as',
    text: 'Welcome',
    room: null,
    loading: false
  }
}

const reducer = (state = initialState, action) => {
  const { type } = action;
  switch(type) {
    case START_SENDING:
      return {...state, [action.id]: { id: action.id, loading: true }}
    case DONE_SENDING:
      return {...state, [action.id]: { id: action.id, text: action.text, loading: false }}
    default:
      return state;
  }
}

export default reducer;
