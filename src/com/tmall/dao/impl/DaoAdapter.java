package com.tmall.dao.impl;

import com.tmall.dao.IDAO;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class DaoAdapter<K,V> implements IDAO<K,V> {
    @Override
    public int daoCreate(V vo) throws Exception {
        return 0;
    }

    @Override
    public int daoUpdate(V vo) throws Exception {
        return 0;
    }

    @Override
    public int daoRemoveBatch(Set<K> ids) throws Exception {
        return 0;
    }

    @Override
    public V daoFindById(K id) throws Exception {
        return null;
    }

    @Override
    public List<V> daoFindSplit(Map<String, Object> map) throws Exception {
        return null;
    }

    @Override
    public int daoCountNumber(String kw) throws Exception {
        return 0;
    }
}
