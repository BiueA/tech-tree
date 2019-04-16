#### Redis

官网：https://redis.io

在线Redis：http://try.redis.io

自己编译redis，redis的配置文件为redis.conf；

根据redis.conf配置文件运行 **redis-server  redis.conf **；

停止redis服务运行一下命令之一：

```shell
#方法一
redis-cli shutdown
#方法二
pkill redis-server
```

客户端连接远程redis-server，redis配置修改：

首先，修改redis.conf

```properties
bind 127.0.0.1
#注释bind，或者追加客户端ip地址

requirepass foobared
#取消requirepass注释，foobared修改成自己的password

protected-mode yes
#不要把保护模式修改为no
```

然后，利用客户端登录连接redis-server

```shell
#方法一
redis-cli -h redis-server_ip -p port -a password

#方法二
#设置环境变量REDISCLI_AUTH
vim .bashrc
#追加
export REDISCLI_AUTH=password
#保存退出，运行
redis-cli -h redis-server_ip -p port
```





##### 变量操作

set  key  value

存入一个key-value



get key

通过key获取value



del key

删除一个key-value



incr key

自增；若key不存在，自动创建一个value为0的key，然后自增



##### 过期时间设置

expire key seconds

设置key的过期时间 ( 秒 )



ttl key

获取key还有多长时间过期；返回值-1，不会过期；返回值-2，已过期；返回值>0，具体时间；



##### 列表操作

rpush list_name value

在listy右部添加一个value



lpush list_name value

在list左部添加一个value



lrange list_name start end

获取list中从start到end的值; start，end都可以为负数; list的索引从0开始，负数表示从尾部计算，正数表示从首部计算



llen list_name 

获取list的长度；



rpop list_name

从右部移除一个value



lpop list_name

从首部移除一个value



##### 集合

SADD  set_key  value

给集合里面添加value



SREM set_key value

从集合里面移除value



SISMEMBER set_key value

测试value是集合里面得元素；返回值1，存在；返回值0，不存在



SMEMBERS set_key

返回集合里面得所以value



SUNION  set_key1  set_key2

并集



##### 排序集合

ZADD \[NX|XX] \[CH] [INCR] set_key score member [score member ...]

排序集合添加元素，根据score值排序



ZRANGE key start stop

返回排序集合里面得元素；索引从0开始；start，stop既可以为正数，也可以为负数；



##### 散列集合

HSET key field value

向散列列表里面添加field和value



HGETALL key

获取散列集合的field和value



HMSET key field value [field value ...]

设置多个field和value



HGET key field

获取散列集合中field的value



HINCRBY key field increment

散列集合中field的值增加increment



HDEL key field [field ...]

删除散列集合中得field


