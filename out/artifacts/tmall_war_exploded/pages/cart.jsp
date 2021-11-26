<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <base  href="/tmall/">
    <meta  charset="utf-8">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/cart.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	<div id="adv-banner">
		<div class="container">
			<img src="images/adv_banner.jpg">
		</div>
	</div>
	<div id="site-nav">
		<div class="container">
			<p><a href="prolist">天猫首页</a></p>
			<p><em>喵，欢迎来天猫</em></p>
			<p><a class="sn-login" href="#" target="_top">请登录</a></p>
			<p><a class="sn-register" href="#" target="_top">免费注册</a></p>
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
				<form action="" target="_top">
					<div class="search-input">
						<input type="text" placeholder="请输入搜索文字" size="65">
						<button type="submit">搜索<s></s></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<div class="cart">
				<div class="banner">
					<div class="title">购物车</div>
					<div class="cart-sum">已选商品（不含运费）<strong class="price">￥<em>0.00</em></strong><a class="submit-btn">结&nbsp;算</a></div>
					<div class="line"></div>
				</div>
				<div class="cart-table-th">
					<div class="wp">
						<div class="th th-chk">
							<div class="cart-checkbox">
								<input type="checkbox" name="select-all">全选
							</div>
						</div>
						<div class="th th-item">
							<div class="td-inner">商品信息</div>
						</div>
						<div class="th th-info">
							<div class="td-inner">&nbsp;</div>
						</div>
						<div class="th th-price">
							<div class="td-inner">单价（元）</div>
						</div>
						<div class="th th-amount">
							<div class="td-inner">数量</div>
						</div>
						<div class="th th-sum">
							<div class="td-inner">金额（元）</div>
						</div>
						<div class="th th-op">
							<div class="td-inner">操作</div>
						</div>
					</div>
				</div>
				<div id="order_list">
				  <!-- 遍历map集合 -->
				  <c:forEach  items="${map}" var="shop">
					<div id="shop_xxx">
						<div class="item-head shop">
							<div class="cart-checkbox">
								<input type="checkbox" name="orders[]">
							</div>
							店铺：
							<a href="#" target="_blank" title="Columbia官方旗舰">${shop.key}</a>
						</div>
						<div class="item-list">
						  <c:forEach items="${shop.value}" var="cart">
							<div class="item"  item>
								<ul class="clearfix"> 
									<li class="td td-chk"> 
										<div class="td-inner">
											<div class="cart-checkbox cart-checkbox-checked">
												<input  cart-cid="${cart.cid}" type="checkbox" name="items[]">
											</div>
										</div> 
									</li> 
									<li class="td td-item"> 
										<div class="td-inner"> 
											<div class="item-pic">
												<a href="#" target="_blank">
													<img width="80" height="80" src="upload-files/${cart.image}" >
												</a>
											</div> 
											<div class="item-info">											
												<a href="#" target="_blank" class="item-title">${cart.title}</a> 
											</div>
											<div class="item-icon-list clearfix">												
												<span class="item-icon item-icon-0" title="支持信用卡支付">
													<img src="images/xcard.png" alt="">
												</span>
												<a href="#" target="_blank" class="item-icon item-icon-1" title="消费者保障服务，卖家承诺7天退换">
													<img src="images/seven-16-16.png" alt="七天退换">
												</a>
												<a href="#" target="_blank" class="item-icon item-icon-2"  title="消费者保障服务，卖家承诺如实描述">
													<img src="images/real-16-16.png" alt="如实描述">
												</a>
												<a href="#" target="_blank" class="item-icon item-icon-3" title="天猫会员专享特权：享受0首付；确认收货后次月10号开始还款；通过支付宝轻松还款！">
													<img src="images/fq-43-16.png" alt="天猫分期">
												</a>												
											</div> 
											
										</div> 									
									</li> 
									<li class="td td-info"> 
										<div class="item-props">
											<p class="sku-line" tabindex="0">颜色分类：3F30003，桔红</p>
											<p class="sku-line" tabindex="0">尺码：M</p>
										</div> 
									</li> 
									<li class="td td-price"> 
										<div class="td-inner">
											<div class="item-price">												
												<div class="price-line">
													<em class="price-original">
													 <fmt:formatNumber  pattern="0.00" value="${cart.price}">
													 </fmt:formatNumber>
 													</em>
												</div>
												<div class="price-line">
													<em class="price-now" tabindex="0">
													   <fmt:formatNumber  pattern="0.00" value="${cart.price*0.8}">
													   </fmt:formatNumber>
													</em>
												</div>												
											</div>
										</div> 
									</li> 
									<li class="td td-amount"> 
										<div class="td-inner">											
											<input type="text" value="${cart.number}" class="text-amount">
										</div> 
									</li> 
									<li class="td td-sum"> 
										<div class="td-inner">
											<em class="number">
											   <fmt:formatNumber  pattern="0.00" value="${cart.price*0.8*cart.number}">
											   </fmt:formatNumber>
											</em>
										</div> 
									</li>
									<li class="td td-op"> 
										<div class="td-inner">
											<a  cart-cid="${cart.cid}" href="javascript:void(0)">删除</a>
										</div> 
									</li>
								</ul>
							</div>
                 	 </c:forEach>
   				   </div>
				 </div>
		  </c:forEach>
	 </div>


				
				<div class="float-bar clearfix has-items fixed-bottom" style="position: fixed;">					
					<div class="float-bar-wrapper">
						<div class="select-all">
							<div class="cart-checkbox">
								<input type="checkbox" name="select-all" value="true">								
							</div>&nbsp;全选
						</div>
						<div class="operations">
							<a href="javascript:void(0)">删除</a>
						</div>
						<div class="float-bar-right">
							<div class="amount-sum">
							  <span class="txt">已选商品</span>
							  <em>0</em><span class="txt">件</span></div>
							<div class="price-sum">
							 <span class="txt">合计（不含运费）:</span>
							 <strong class="price">￥<em>0.00</em></strong></div>
							<div class="btn-area"><a href="javascript:void(0)" class="submit-btn"><span>结&nbsp;算</span><b></b></a></div>
						</div>
					</div> 
				</div>
								
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