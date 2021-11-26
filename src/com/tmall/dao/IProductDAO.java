package com.tmall.dao;
import com.tmall.vo.Product;
public interface IProductDAO extends IDAO<String, Product> {
    //继承父接口时，定义好泛型的具体类型
}
