package com.tmall.dao.impl;
import com.sun.annotations.Component;
import com.sun.utils.DBUtil;
import com.tmall.dao.IProductDAO;
import com.tmall.vo.Product;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
@Component//打上该注解的类。框架都会为该类创建一个对象并且保存到容器中，在需要的时候，程序可以直接使用
public class ProductDAOImpl extends DaoAdapter<String,Product> implements IProductDAO {
    private Connection conn;//只需要声明出来，自动帮你获取连接
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
    public Product daoFindById(String id) throws Exception {
        String sql = "SELECT product_id,title,price,images,sales,comments FROM product" +
                "WHERE product_id=?";
        return DBUtil.selectOne(conn,sql,Product.class,id);
    }

    @Override
    public List<Product> daoFindSplit(Map<String, Object> map) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT product_id,title,price,image,sales,comments,shop_id,shop_name,category_id,category_name FROM product_view\n" +
                "WHERE title LIKE ?" +
                "ORDER BY"+ map.get("columns")+" " +map.get("sort")+"limit ?,?";
        list=DBUtil.selectList(conn,sql,Product.class,map.get("kw"),map.get("start"),map.get("ls"));
        return list;
    }

    @Override
    public int daoCountNumber(String kw) throws Exception {
        String sql = "SELECT COUNT(*) FROM product WHERE title LIKE ?";
        return DBUtil.selectCount(conn,sql,"%"+kw+"%");
    }
}
