
Cumulo Pipeline
----

EventStream Pipeline for Cumulo Apps

### Usage

```
npm i --save cumulo-pipeline
```
```
Pipeline = require 'pipeline'
p1 = Pipeline.create()
p2 = Pipeline.create()
Pipeline.forward p1, p2

Pipline.for p2, (x) ->
  console.log 'got event', x

Pipeline.send p1, 'event'
```

See `test.cirru` for more.

### Methods

`send` and `for` are from Go syntax.

* `send` send data into pipes
* `for` get data from pipes
* `forward` send data to next pipe
* `map` map events into a new pipe
* `reduce` reduce events into a new pipe

### License

MIT
