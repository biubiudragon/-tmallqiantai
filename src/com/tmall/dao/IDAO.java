package com.tmall.dao;
import java.util.List;
import java.util.Map;
import java.util.Set;
public interface IDAO<K,V> {
    /**
     *
     * @param vo
     * @return
     * @throws Exception
     */
    public int daoCreate(V vo)throws Exception;

    /**
     *
     * @param vo
     * @return
     * @throws Exception
     */
    public int daoUpdate(V vo)throws Exception;

    /**
     * 批量删除
     * @param ids 保存了要删除的编号集合
     * @return
     * @throws Exception
     */
    public int daoRemoveBatch(Set<K> ids) throws Exception;

    /**
     * 根据编号查询
     * @param id
     * @return
     * @throws Exception
     */
    public V daoFindById(K id)throws Exception;

    /**
     * 模糊分页查询
     * @param map 保存了查询条件的集合
     * @return
     * @throws Exception
     */
    public List<V> daoFindSplit(Map<String,Object> map)throws Exception;

    /**
     * 统计数据量
     * @param kw 模糊查询的关键字
     * @return
     * @throws Exception
     */
    public int daoCountNumber(String kw) throws Exception;
}
