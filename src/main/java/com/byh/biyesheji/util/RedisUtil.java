package com.byh.biyesheji.util;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * 功能描述
 *
 */

@Component
public class RedisUtil {

    // 可用连接实例的最大数目，默认值为8；
    // 如果赋值为-1，则表示不限制；如果pool已经分配了maxTotal个jedis实例，则此时pool的状态为exhausted(耗尽)。
    private static int MAX_TOTAL = 100;

    // 控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
    private static int MAX_IDLE = 20;

    // 等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException；
    private static int MAX_WAIT = 20000;

    // 超时时间 毫秒
    private static int TIMEOUT = 20000;

    private static JedisPool jedisPool = null;
    /**
     * 初始化Redis连接池
     */
    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            // 连接耗尽时是否阻塞, false报异常,ture阻塞直到超时, 默认true
            config.setBlockWhenExhausted(true);
            // 设置的逐出策略类名, 默认DefaultEvictionPolicy(当连接超过最大空闲时间,或连接数超过最大空闲连接数)
            config.setEvictionPolicyClassName("org.apache.commons.pool2.impl.DefaultEvictionPolicy");
            // 是否启用pool的jmx管理功能, 默认true
            config.setJmxEnabled(true);
            // 最大空闲连接数, 默认8个 控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
            config.setMaxIdle(MAX_IDLE);
            // 最大连接数, 默认8个
            config.setMaxTotal(MAX_TOTAL);
            // 表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；
            config.setMaxWaitMillis(MAX_WAIT);
            // 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
            config.setTestOnBorrow(true);
            config.setTestOnReturn(true);
            jedisPool = new JedisPool(config, "192.168.48.128", 6379, TIMEOUT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Resource
    private RedisTemplate<String, String> redisTemplate;

    public void set(String key, String value) {
        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
        valueOperations.set(key, value);

    }

    public String get(String key) {
        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
        return valueOperations.get(key);
    }

    /**
     * 获取redis中所有数据
     */
    public HashMap<String,String> getAll(){
        //获得所有的key
        Set<String> keys = redisTemplate.keys("*");
        HashMap<String,String> map = new HashMap<>();
        for (String key:keys){
            String value = redisTemplate.opsForValue().get(key);
            map.put(key,value);
        }
        return map;
    }


    /**
     * 设置key的生命周期
     *
     * @param key
     * @param time
     * @param
     */
    public boolean expire(String key, long time) {
        try {
            if (time > 0) {
                redisTemplate.expire(key, time, TimeUnit.SECONDS);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    /**
     * @param key
     * @param value
     * @param time  单位：秒
     * @return
     */
    public boolean set(String key, String value, long time) {
        try {
            if (time > 0) {
                redisTemplate.opsForValue().set(key, value, time, TimeUnit.SECONDS);
            } else {
                set(key, value);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
