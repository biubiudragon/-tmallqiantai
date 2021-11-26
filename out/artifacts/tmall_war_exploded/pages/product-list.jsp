<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
   <base  href="/tmall/">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/product-list.css">	
	<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">	
<style type="text/css">
	   .container   a  span{
	       margin-top:4px;
		   color:red;
		   font-size:18px;
	   }
	</style>
</head>
<body>
	<div id="adv-banner">
		<div class="container">
			<img src="images/adv_banner.jpg">
		</div>
	</div>
	<div id="site-nav">
		<div class="container">
			<p><a href="#">天猫首页</a></p>
			<p><em>喵，欢迎${user.username}来天猫</em></p>
			<c:if test="${user.username==null}">
			     <p><a class="sn-login" href="login.jsp" target="_top">请登录</a></p>
			</c:if>
			<c:if test="${user.username==null}">
			     <p><a class="sn-register" href="#" target="_top">免费注册</a></p>
			</c:if>
			<p style="margin-left:450px;">
				<a  href="cart/list" target="_top">
			    	<span class="fa fa-shopping-cart"></span>
				</a>
			</p>
		</div>
	</div>
	<div id="header">
		<div class="container">
			<div class="logo">
				<a href="#" title="">
					<img src="images/logo-190-27.png">
				</a>
			</div>
			<div class="search-box">
				<form action="product/list" target="_top">
					<div class="search-input">
						<input type="text"  name="kw" placeholder="请输入搜索文字" size="65">
						<button type="submit">搜索<s></s></button>
					</div>
				</form>
			</div>
		</div>
	</div>
   <!-- 为排序进行url地址重组 -->
   <c:url  var="sortUrl"  value="product/list?">
      <c:forEach  items="${param}" var="item">
         <c:if test="${item.key!='column'&&item.key!='sort'}">
            <c:param name="${item.key}" value="${item.value}"></c:param>
         </c:if>
      </c:forEach>
   </c:url>
   <!-- 为分页重组url地址 -->
   <c:url  var="pageUrl" value="product/list?">
      <c:forEach  items="${param}" var="item">
            <c:if test="${item.key!='cp'}">
               <c:param name="${item.key}" value="${item.value}"></c:param>
            </c:if>
      </c:forEach>
   </c:url>
	<div id="content">
		<div class="container">
			<div class="filter">
				<a class="sort current" href="#">综合<i class="arrow-up"></i></a>
				<a class="sort" href="#">人气<i class="arrow-up"></i></a>
				<a class="sort" href="${sortUrl}column=sales&sort=desc">销量<i class="arrow-up"></i></a>
				<a class="sort" href="${sortUrl}column=price&sort=asc">价格升序<i class="arrow-up"></i></a>
				<a class="sort" href="${sortUrl}column=price&sort=desc">价格降序<i class="arrow-down"></i></a>
			</div>
			<div class="view-list clearfix">
		  	<c:forEach   items="${map.allList}" var="item">
				<div class="product item">
					<div class="product-iWrap">
						<div class="productImg-wrap">
							<a href="product/one?pid=${item.product_id}">
								<img src="upload-files/${item.image}">
							</a>
						</div>
						<div class="productThumb">
						   <c:forEach  items="${item.thumbs}" var="thumb">
							         <b class="proThumb-img" data-index="1:1">
										<img src="upload-files/${thumb}">
										<i></i>
									</b>
						   </c:forEach>
						</div>
						<p class="productPrice">
							<em title="1299.00"><b>¥</b>
							<fmt:formatNumber  pattern="0.00" value="${item.price}"></fmt:formatNumber>
							</em>
						</p>
						<p class="productTitle">
							<a href="#" target="_blank" title="${item.title}">
								<span class="H" style="font-size:10px">Columbia</span>
								<span class="H" style="font-size:10px">哥伦比亚</span>${item.title}
							</a>
						</p>
						<div class="productShop">
							<a class="productShop-name" href="#" target="_blank">${item.shop_name}</a>
						</div>
						<p class="productStatus">
							<span>月成交 <em>${item.sales}笔</em></span>
							<span>评价 <a href="#" target="_blank">${item.comments}</a></span>
						</p>
					</div>
    				 </div>
		          </c:forEach>
			</div>
		</div>
		<div class="ui-page clear">
			<div class="ui-page-wrap">
			 共${map.allPages}页
				<b class="ui-page-num">
					 <c:if test="${map.page.first}">
	   					<b class="ui-page-prev">&lt;&lt;上一页</b>
					 </c:if>
					 <c:if test="${!map.page.first}">
					    <a class="ui-page-prev" href="${pageUrl}cp=${map.page.cp-1}">&lt;&lt;上一页</a>
					 </c:if>
					 <c:if test="${map.page.hasPre}">
				          <b class="ui-page-break">...</b>
					 </c:if>
					 <c:forEach items="${map.page.pages}" var="page">
					   <c:if test="${map.page.cp==page}">
					       <b class="ui-page-cur">${page}</b>
					   </c:if>
					   <c:if test="${map.page.cp!=page}">
					       <a href="${pageUrl}cp=${page}">${page}</a>
					   </c:if>
					 </c:forEach>
					 <c:if test="${map.page.hasNext}">
				          <b class="ui-page-break">...</b>
					 </c:if>
					<c:if test="${map.page.last}">
					     <b class="ui-page-prev">下一页&gt;&gt;</b>
					</c:if>
					<c:if test="${!map.page.last}">
						<a class="ui-page-next" href="${pageUrl}cp=${map.page.cp+1}">下一页&gt;&gt;</a>
					</c:if>
				</b>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="container">
		<img src="images/ensure.jpg">
		</div>
	</div>
</body>

</html>