package com.tmall.controller;

import com.sun.annotations.Controller;
import com.sun.annotations.RequestMapping;
import com.sun.annotations.RequestParam;
import com.sun.annotations.Resource;
import com.sun.web.Model;
import com.tmall.service.IProductService;

import java.util.HashMap;
import java.util.Map;
//表示一个控制器，代替之前开发中servlet的作用
@Controller
//表示该控制器处理的映射父路径
@RequestMapping("/product/*")
public class ProductServlet  {
    @Resource
    private IProductService service;
    @RequestMapping("list")
    public String list(Model model, @RequestParam("''")String column, @RequestParam("''")String sort, @RequestParam("") String kw, @RequestParam("1") Integer cp)throws Exception{
        Integer ls=15;
        Map<String,Object> parmap = new HashMap<>();
        parmap.put("start",(cp-1)*ls);
        parmap.put("cp",cp);
        parmap.put("column",column);
        parmap.put("sort",sort);
        parmap.put("kw","%"+kw+"%");
        Map<String,Object> productInfo = new HashMap<>();
        model.add("map",service.serviceFindSplit(parmap));
        //调用业务层方法
        productInfo.put("map",service.serviceFindSplit(parmap));
        model.add("",kw);
        //实现服务端跳转
        return "pages/product_list.jsp";
    }
    @RequestMapping("one")
    public  String getOne(String pid,Model model)throws Exception{
        model.add("product",service.serviceFindById(pid));
        //等价之前使用request内置对象的setAttribute(key,value)方法
        return "/pages/product.jsp";
    }


}
