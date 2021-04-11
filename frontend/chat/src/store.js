import { createStore, applyMiddleware, compose } from 'redux'
import createSagaMiddleware from 'redux-saga'
import rootReducer from './modules'
import handleMessages from './sagas/handleMessages'

const sagaMiddleware = createSagaMiddleware()

const enhancers = []
const middleware = [sagaMiddleware]

if (process.env.NODE_ENV === 'development') {
  const devToolsExtension = window.__REDUX_DEVTOOLS_EXTENSION__

  if (typeof devToolsExtension === 'function') {
    enhancers.push(devToolsExtension())
  }
}

const composedEnhancers = compose(
  applyMiddleware(...middleware),
  ...enhancers
)
const store = createStore(
  rootReducer,
  {},
  composedEnhancers
)

sagaMiddleware.run(handleMessages);

export default store;
