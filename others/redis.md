# Redis
## Basics
- A large key value store that stores them in memory for faster access.
- The default port is 6379

## Starting redis
``` sh
# run redis directly in the background
docker run -d --name redis -p 6379:6379 redis
# connect to redis using cli
docker exec -it redis redis-cli
```
## Commands
- SET, GET, DELETE and EXISTS
``` sh
SET name yogi 
GET name # works only for strings
DEL name # delete name
EXISTS name # check if a key is present
```

- Expiry, Show All Keys, remove all keys
``` sh
KEYS * # search by pattern
flushall # removes all keys
ttl key # time to live of the key
expire key seconds # set the expiry of a key after its been set
setex key seconds value # set the expiry of a key when setting it
```

- LIST
``` sh
lpush key value # push an array into a key
lrange key 0 -1 # get all values
rpush key value # push to the right of the list
LPOP key # pop the first value pushed to the list
RPOP key # pop the last value pushed to the list
```

- SETS
``` sh
SADD key value # use double quotes to denote strings with spaces
SMEMBERS key
SREM key value
```

- HASHES
``` sh 
HSET key innerkey name
HGET key innerkey
HGETALL key
HDEL key innerkey
HEXISTS key innerkey
```


