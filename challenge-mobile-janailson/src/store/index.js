import { createStore, applyMiddleware } from 'redux'
import reducers from './reducers'
import promise from 'redux-promise'

const store = createStore(reducers, applyMiddleware(promise))

export default store