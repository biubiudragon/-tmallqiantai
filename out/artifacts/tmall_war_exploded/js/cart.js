$(document).ready(function(){
	  //绑定购物项添加事件
	$(".btn-basket").click(addCartFun);
  	  //绑定全选反选事件
	$("input[name='select-all']").change(select_all_fun);
	 //绑定店铺全选反选事件
	$("input[name='orders[]']").change(select_shop_fun);
	//绑定单选事件
	$("input[name='items[]']").change(select_item_fun);
	//绑定单项删除事件
	$(".td-op .td-inner a").click(delete_item_fun);
	//绑定批量删除事件
	$(".operations a").click(delete_batch_fun);
})
//处理批量删除的函数
function  delete_batch_fun(){
	//声明一个数组保存要删除的商品编号
	var  cids=[];
	//将当前迭代到的商品的编号保存到数组
	$("input[name='items[]']:checked").each(function(){
		cids.push($(this).attr("cart-cid"));
	})
	if(cids.length==0){
		alert("你还没有原则任何商品");
		return ;
	}
	$.ajax({
	   url:"cart/delete",
	   data:{"cids[]":cids},
	   success:function (data){
		   if(data.trim()=="true"){//如果删除成功则应该在页面把对应的样式去掉
				  $("input[name='items[]']:checked").parents("div[item]").fadeOut("1000",function(){
					  $("input[name='items[]']:checked").parents("div[item]").remove();
					   $("div[id='shop_xxx']").each(function(){
						    var isRemove=$(this).find("div[item]").length==0;
						    if(isRemove){
						    	$(this).remove();
						    }
						 })
				  });
			  }else{
				   alert("删除失败")
			  }
	   },
	   async:false
	 })
}
//处理单项删除的函数
function  delete_item_fun(){
    //取得要删除的购物项的编号
	var  cid=$(this).attr("cart-cid");
	var  item_div=$(this).parents("div[item]");
	//可能被删除的店铺的div
	var  shop_div=$(this).parents("div[id='shop_xxx']");
	//发送异步请求实现删除
	$.ajax({ 
		url: "cart/delete",
		data:{"cids[]":cid},
		success: function(data){
			if(data=="true"){
				//删除页面对应的样式（div）
				 item_div.fadeOut("1000",function(){
					  item_div.remove();
					    if(shop_div.find("div[item]").length==0){
							shop_div.remove();
						}
				 })
			}else{
				alert("删除失败");
			}
		},
		async : false//使用false就是同步处理，只有当前的请求处理成功之后才执行后面的代码
	});	
	//判断当前店铺下是否还有其他购物项,如果等于0则flag的值为true，表示当前店铺没有购物项了可以删除了
}
//处理根据选择状态改变颜色的函数
function  change_color_fun(){
	$("input[name='items[]']").each(function(){
	if($(this).prop("checked")){
		  $(this).parents("div[item]").addClass("item   item-selected");
  	   }else{
		  $(this).parents("div[item]").attr("class","item");
	   }
	})
}
//处理单选的函数
function  select_item_fun(){
	//处理店铺下的单选
	var  shop_checked=$(this).parents("div[id='shop_xxx']").find("input[name='items[]']:not(:checked)").length==0;
	$(this).parents("div[id='shop_xxx']").find("input[name='orders[]']").prop("checked",shop_checked);
	//根据单选改变整个页面全选复选框状态
	var  page_checked=$("input[name='orders[]']:not(:checked)").length==0;
	$("input[name='select-all']").prop("checked",page_checked);
	 change_color_fun();
	 count_fun();
}
//统计总金额和件数的函数
function  count_fun(){
	//保存件数的变量
	 var  number=0;
	 var  total=0;
	//选择出所有被选中的购物项
	$("input[name='items[]']:checked").each(function(){
		//统计件数
        number+=1;
        //统计总金额
        total+=parseFloat($(this).parents("div[item]").find(".td-sum em").text());
	})
	//将统计出来的数据放到指定的位置
	$(".amount-sum em").text(number);
	$(".price-sum .price  em").text(total.toFixed(2));
	$(".cart-sum .price em").text(total.toFixed(2));
}
//处理店铺全选反选事件
function  select_shop_fun(){
	//取得触发该函数的复选框的选择状态
	var checked=$(this).prop("checked");
	$(this).parents("div[id='shop_xxx']").find("input[name='items[]']").prop("checked",checked);
	select_item_fun();
}
//处理全选反选的函数
function  select_all_fun(){
	//取得选择状态
	var checked=$(this).prop("checked");
	//取得店铺的复选框
	$("input[name='orders[]'],input[name='items[]']").prop("checked",checked);
	change_color_fun();
	count_fun();
}

//处理添加购物项的函数
function  addCartFun(){
	 //取得购物项的数量
	 var   number=$(".amount-panel  input").val();
	 //取得商品的编号
	 var  pid=$(".amount-panel  input").attr("pid");
	 //之后将编号和以及数量保存到数据库
	 $.get("cart/add",{"number":number,"cid":pid},function(data){
		   if(data=="Unlogin"){//此时表示没有登录
			     alert("请登录");
			     window.location.href="login.jsp";
		   }else{
			    alert(data);
		   }
	 })
} 