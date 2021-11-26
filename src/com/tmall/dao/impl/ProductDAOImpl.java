package com.tmall.dao.impl;
import com.tmall.dao.IProductDAO;
import com.tmall.vo.Product;
import java.util.List;
import java.util.Map;
import java.util.Set;
public class ProductDAOImpl extends DaoAdapter<String,Product> implements IProductDAO {
    @Override
    public int daoCreate(Product vo) throws Exception {
        return 0;
    }

    @Override
    public int daoUpdate(Product vo) throws Exception {
        return 0;
    }

    @Override
    public int daoRemoveBatch(Set<String> ids) throws Exception {
        return 0;
    }

    @Override
    public V daoFindById(String id) throws Exception {
        return null;
    }

    @Override
    public List<Product> daoFindSplit(Map<String, Object> map) throws Exception {
        return null;
    }

    @Override
    public int daoCountNumber(String kw) throws Exception {
        return 0;
    }
}
