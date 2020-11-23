import { combineReducers } from 'redux'
import loginReducer from './loginReducer'
import reposReducer from './reposReducer'

const reducers = combineReducers({
    login: loginReducer,
    repos: reposReducer,
})

export default reducers