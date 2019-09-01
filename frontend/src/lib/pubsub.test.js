import { PubSub } from './pubsub'

describe('PubSub library', () => {
  let pubsub

  beforeEach(() => {
    pubsub = new PubSub()
  })

  afterEach(() => {
    pubsub.destroy()
    pubsub = null
  })

  it('should have an empty list of events', () => {
    expect(pubsub.events).toEqual({})
  })

  describe('when a single event is used', () => {
    it('should subscribe one callback', () => {
      let callback = jasmine.createSpy()

      pubsub.subscribe('stateChange', callback)

      expect(pubsub.events['stateChange'][0]).toBe(callback)
    })

    it('should call single callback on publish', () => {
      let callback = jasmine.createSpy()

      pubsub.subscribe('stateChange', callback)
      pubsub.publish('stateChange', { hey: 'yo' })

      expect(callback).toHaveBeenCalledWith({ hey: 'yo' })
    })
  })

  describe('when multiple events are used', () => {
    const NUMBER_OF_MOCKS = 5
    const EVENT_NAME = 'stateChange'

    it('should subscribe multiple callbacks to the same event', () => {
      let callbacks = []

      for (let i = 0; i < NUMBER_OF_MOCKS; i++) {
        callbacks[i] = jasmine.createSpy()
        pubsub.subscribe(EVENT_NAME, callbacks[i])
      }

      for (let i = 0; i < NUMBER_OF_MOCKS; i++) {
        expect(pubsub.events[EVENT_NAME][i]).toBe(callbacks[i])
      }
    })

    it('should call multiple callbacks upon publish', () => {
      let callbacks = []

      for (let i = 0; i < NUMBER_OF_MOCKS; i++) {
        callbacks[i] = jasmine.createSpy()
        pubsub.subscribe(EVENT_NAME, callbacks[i])
      }

      pubsub.publish('stateChange', { hey: 'yo' })

      for (let i = 0; i < NUMBER_OF_MOCKS; i++) {
        expect(pubsub.events[EVENT_NAME][i]).toHaveBeenCalledWith({ hey: 'yo' })
      }
    })
  })
})
