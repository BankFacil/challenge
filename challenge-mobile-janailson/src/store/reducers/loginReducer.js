import { SET_EMAIL, SET_PASSWORD } from '../actions/actionTypes'

export const initialState = {
    email: null,
    password: null,
}

const loginReducer = (state = initialState, {type, data}) => {
    switch (type) {
        case SET_EMAIL:
            return { ...state, email: data }
        case SET_PASSWORD:
            return { ...state, password: data }
        default:
            return state
    }
}

export default loginReducer