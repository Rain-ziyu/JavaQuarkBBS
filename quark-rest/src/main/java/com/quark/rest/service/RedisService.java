package com.quark.rest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @Author LHR
 * Create By 2017/8/31
 */
@Service
public class RedisService<T> {

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 设置String缓存
     * @param key
     * @param t
     */
    public void cacheString(String key, T t,int time){
        ValueOperations<String, T> operations = redisTemplate.opsForValue();
        operations.set(key,t,time, TimeUnit.HOURS);
    }
    /**
     * 设置String缓存
     * @param key
     * @param t
     */
    public void cacheString(String key, T t){
        ValueOperations<String, T> operations = redisTemplate.opsForValue();
        operations.set(key,t);
    }

    /**
     * 获取String缓存并更新
     * @param key
     * @return
     */
    public T getStringAndUpDate(String key,int time){
        ValueOperations<String, T> operations = redisTemplate.opsForValue();
        T t = operations.get(key);
        if (t!=null) operations.set(key,t,time, TimeUnit.HOURS);
        return t;
    }

    /**
     * 获取String缓存
     * @param key
     * @return
     */
    public T getString(String key){
        ValueOperations<String, T> operations = redisTemplate.opsForValue();
        T t = operations.get(key);
        return t;
    }

    /**
     * 删除String缓存
     * @param key
     */
    public void deleteString(String key){
        redisTemplate.delete(key);
    }

    /**
     * 判断String是否存在键key
     * @param key
     * @return
     */
    public boolean stringHasKey(String key){
        ValueOperations<String, T> operations = redisTemplate.opsForValue();
        return redisTemplate.hasKey(key);
    }

    /**
     * 设置Set缓存
     * @param key
     * @param t
     */
    public void cacheSet(String key,T t){
        SetOperations<String,T> opsForSet = redisTemplate.opsForSet();
        opsForSet.add(key,t);
    }

    /**
     * 删除Set缓存
     * @param key
     * @param t
     */
    public void deleteSet(String key,T t){
        SetOperations<String,T> opsForSet = redisTemplate.opsForSet();
        opsForSet.remove(key,t);
    }

    /**
     * 判断Set是否存在value
     * @param key
     * @param t
     * @return
     */
    public boolean setHasValue(String key, T t){
        SetOperations<String,T> opsForSet = redisTemplate.opsForSet();
        return opsForSet.isMember(key, t);
    }

    /**
     * 向对应list类型的的key插入新的值
     * @param key
     * @param t
     * @return
     */
    public Long setListValue(String key, T t){
        SetOperations<String,T> opsForSet = redisTemplate.opsForSet();
        ListOperations opsList = redisTemplate.opsForList();
        return  opsList.leftPush(key, t);
    }

    /**
     * 向对应list类型的的key设置过期时间
     * @param time
     * @param key
     * @return
     */
    public Boolean setListTime(String key, int time){
        return    redisTemplate.boundValueOps(key).expire(time,TimeUnit.MINUTES);
    }

    /**
     * 获取对应list类型的的key下的对应区间内的的值
     * @param key
     * @return
     */
    public List getListValue(String key,int begin,int end){
        return   redisTemplate.boundListOps(key).range(begin, end);
    }
    /**
     * 获取对应list类型的的key下的对应长度
     * @param key
     * @return
     */
    public Long getListLength(String key){
        return   redisTemplate.boundListOps(key).size();
    }

    /**
     * 获取对应zset类型的的key下的某一元素的分数
     * @param key
     * @return
     */
    public Double getZset(String key,String item){
        Double score = redisTemplate.boundZSetOps(key).score(item);
        return   score;
    }


}
