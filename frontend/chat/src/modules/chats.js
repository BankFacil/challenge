const CHANGE_MESSAGE = 'app/chat/CHANGE_MESSAGE';

export const changeMessage = (payload) => ({
  type: CHANGE_MESSAGE,
  payload
})

const initialState = {
  message: '',
  rooms: {
  }
}

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case CHANGE_MESSAGE:
      return { ...state, message: action.payload }
    default:
      return state;
  }
}

export default reducer;
