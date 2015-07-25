
-- ":learning from"
-- :https://medium.com/@yelouafi/from-callback-to-future-functor-monad-6c86d9c16cb5

var Future $ \ ()
  = this.slots $ []

= module.exports Future

= Future.proptotype.ready $ \ (slot)
  if this.completed
    do $ slot this.value
    do $ this.slots.push slot

= Future.proptotype.complete $ \ (val)
  if this.completed
    do $ throw ":Can not complete a completed Future"

  = this.value val
  = this.completed true

  this.slots.forEach $ \ (slot)
    slot value

  = this.slots null

= Future.unit $ \ (val)
  var fut $ new Future
  fut.completed val
  return fut

= Future.delay $ \ (v millis)
  var f $ new Future
  setTimeout (\ () (f.complete v)) millis
  return f

= Future.proptotype.fmap $ \ (fn)
  var fut $ new Future
  this.ready $ \ (val)
    fut.complete (fn val)
  return fut
