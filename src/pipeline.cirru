
class Pipeline
  constructor $ \ ()
    = this.listeners $ []

  send $ \ (x)
    this.listeners.forEach $ \ (handler)
      handler x

  for $ \ (handler)
    this.listeners.push handler

  forward $ \ (next)
    this.for $ \ (data)
      next.send data

  map $ \ (handler)
    var x1 $ new Pipeline
    this.for $ \ (data)
      x1.send $ handler data
    return x1

  reduce $ \ (initial handler)
    var internalState initial
    var x1 $ new Pipeline
    this.for $ \ (data)
      = internalState $ handler internalState data
      x1.send internalState
    return x1

= module.exports Pipeline
