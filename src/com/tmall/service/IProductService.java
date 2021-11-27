package com.tmall.service;

import com.tmall.vo.Product;

import java.util.Map;

public interface IProductService {
    /**
     * 根据商品编号查询数据
     * @param pid 商品编号
     * @return 返回对应对象
     * @throws Exception
     */
    public Product serviceFindById(String pid) throws Exception;

    /**
     * 模糊分页查询数据
     * daoFindSplit() daoCountNumber
     * @param parmmap 保存了查询条件的Map集合
     * @return 返回保存了商品信息和分页信息的Map集合
     * @throws Exception
     */
    public Map<String,Object> serviceFindSplit(Map<String,Object> parmmap) throws Exception;
}
