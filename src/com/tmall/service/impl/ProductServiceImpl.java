package com.tmall.service.impl;

import com.sun.annotations.Service;
import com.tmall.dao.IProductDAO;
import com.tmall.dao.impl.ProductDAOImpl;
import com.tmall.service.IProductService;
import com.tmall.vo.Product;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 创建一个ProductServiceImpl实现类的对象，供给给控制层使用
 */
@Service
public class ProductServiceImpl implements IProductService {
    //传统开发private IProductDAO iProductDAO = new ProductDAOImpl();
    /**
     * 注解作用
     *      自动在容器中检索一个IProductDAO接口的实现类对象，赋值给dao对象
     */
    @Resource
    private IProductDAO dao;
    @Override
    public Product serviceFindById(String pid) throws Exception {
        return this.dao.daoFindById(pid);
    }

    @Override
    public Map<String, Object> serviceFindSplit(Map<String, Object> parmmap) throws Exception {
        //创建一个Map集合保存查询到的商品信息
        Map<String,Object> allList = new HashMap<>();
        //调用数据层方法查询
        allList.put("allList",dao.daoFindSplit(parmmap));
        //统计数据量
        int number = dao.daoCountNumber((String) parmmap.get("kw"));
        allList.put("number",number);
        return allList;
    }
}
