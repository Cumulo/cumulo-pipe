
Cumulo Pipeline
----

EventStream Pipeline for Cumulo Apps

### Usage

```
npm i --save cumulo-pipeline
```

```coffee
Pipeline = require 'cumulo-pipeline'

p1 = new Pipeline
p2 = new Pipeline
p1.forward p2

p2.for (x) -> console.log 'got event', x

p1.send 'event'
```

See `test.cirru` for more:

```cirru

var
  Pipeline $ require :./src/pipeline

var
  p1 $ new Pipeline
  p2 $ new Pipeline

p1.forward p2
p2.for $ \ (x)
  console.log :event x

var p3 $ p1.map $ \ (x)
  return $ + ":::" x

p3.for $ \ (x)
  console.log x

p1.send :x

var p4 $ p1.reduce 0 $ \ (a b) $ return $ + a b

p4.for $ \ (x)
  console.log x

var data $ [] 1 2 3 4 5
data.forEach $ \ (x) (p1.send x)
```

### Methods

`send` and `for` are from Go syntax.

* `send` send data into pipes
* `for` get data from pipes
* `forward` send data to next pipe
* `map` map events into a new pipe
* `reduce` reduce events into a new pipe

### License

MIT
