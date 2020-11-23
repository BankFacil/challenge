import { SET_REPOS } from '../actions/actionTypes'

export const initialState = {
    repos: null,
    commits: null
}

const reposReducer = (state = initialState, {type, data}) => {
    switch (type) {
        case SET_REPOS:
            return { ...state, repos: data }
        default:
            return state
    }
}

export default reposReducer