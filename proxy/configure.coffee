redis  = require 'redis'

subscriber = redis.createClient(6379, '192.168.183.134')
client     = redis.createClient(6379, '192.168.183.134')

subscriber.on 'message', (c, m) ->
  client.hgetall 'test', (e, o) ->
    console.log c, m, (e or o)

subscriber.subscribe '__keyspace@0__:test'

