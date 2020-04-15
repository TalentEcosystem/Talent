<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>首页</title>
	<% String path=request.getContextPath();%>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css" charset="UTF-8" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/style.css" charset="UTF-8" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/my.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js" charset="UTF-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/cityselect.css" charset="UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/cityselect.js" charset="UTF-8"></script>


	<style>
		.product-cont .lunbo{
			width: 100%;
			height: 150px;
			margin-top: -330px;
			margin-bottom: -100px;
			background-color: #f0f0f0;
		}
		.product-cont  .cont-title {
			font-size: 20px;
			font-weight: 700;
			line-height: 50px;
			color: #00a346;
			padding-bottom: 50px;
			position: relative;
			text-align: center;
			padding-top: 50px;
		}
		.product-cont{
			color: #00a346;
			cursor: pointer;
			padding-bottom: 0px;
		}
		.product-cont .cont-title:after {
			content: '';
			display: block;
			width: 38px;
			border-bottom: 1px solid #000;
			position: absolute;
			left: calc(10% - 19px);
			/*margin-top: 10px;*/
		}
		.product-cont .product .product-list > p{
			text-align: left;
			font-size: 14px;
			line-height: 24px;
			color: #707070;
			padding: 0 30px;
		}
		.product-cont .product .product-list > p.product-text{
			margin-bottom: 20px;
		}
		.in img {
			width: 50px;
			height: 50px;
			float: left;
			padding-left: 100px;
		}
		.in {
			width:5500px;
			padding-left: 1000px;
			position: absolute;
		}
		.out {
			width: 800px;
			height: 170px;
			overflow:hidden;
			margin: 0px auto;
			position: relative;

		}
		.left {
			width: 22px;
			height: 39px;
			left: 240px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			margin-top: -130px;
		}
		.right {
			width: 22px;
			height: 39px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			right: 240px;
			margin-top: -130px;
		}
		.in .pic {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 120px;
			float: left;
		}
		.in .pic1 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic2 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic3 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic4 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic5 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic6 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic7 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic8 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic9 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic10 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic11 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic12 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic13 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in .pic14 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.childss {
			width: 150px;
			height: 0px;
			background-color:#000000;
			opacity: 0;
			color: #ffffff;
			font-size: 20px;
			font-weight: normal;
			position: absolute;
			bottom: 220px;
		}
		.childss p{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 0 0 10px;
			margin-right: 28px;
			font-weight: normal;
			float: left;
			color: #ffffff;
			padding-bottom: 20px;
		}
		.childss i{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 15px 0 0;
			font-weight: normal;
			float: right;
			color: white;
			padding-bottom: 20px;
		}

	</style>
	<style>
		.product-cont1 .lunbo1{
			width: 100%;
			height: 150px;
			margin-top: -330px;
			margin-bottom: -100px;
			background-color: #f0f0f0;
		}
		.product-cont1  .cont-title1 {
			font-size: 20px;
			font-weight: 700;
			line-height: 50px;
			color: #00a346;
			padding-bottom: 50px;
			position: relative;
			text-align: center;
			padding-top: 50px;
		}
		.product-cont1{
			color: #00a346;
			cursor: pointer;
			padding-bottom: 0px;
		}
		.product-cont1 .cont-title1:after {
			content: '';
			display: block;
			width: 38px;
			border-bottom: 1px solid #000;
			position: absolute;
			left: calc(10% - 19px);
			/*margin-top: 10px;*/
		}
		.product-cont1 .product1 .product-list1 > p{
			text-align: left;
			font-size: 14px;
			line-height: 24px;
			color: #707070;
			padding: 0 30px;
		}
		.product-cont1 .product1 .product-list1 > p.product-text1{
			margin-bottom: 20px;
		}
		.in1 img {
			width: 50px;
			height: 50px;
			float: left;
			padding-left: 100px;
		}
		.in1 {
			width:5500px;
			padding-left: 1000px;
			position: absolute;
		}
		.out1 {
			width: 800px;
			height: 170px;
			overflow:hidden;
			margin: 0px auto;
			position: relative;

		}
		.left1 {
			width: 22px;
			height: 39px;
			left: 240px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			margin-top: -130px;
		}
		.right1 {
			width: 22px;
			height: 39px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			right: 240px;
			margin-top: -130px;
		}
		.in1 .pic0 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 120px;
			float: left;
		}
		.in1 .pic11 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic21 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic31 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic41 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic51 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic61 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic71 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic81 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic91 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic101 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic111 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic121 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic131 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in1 .pic141 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/2.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.childss1 {
			width: 150px;
			height: 0px;
			background-color:#000000;
			opacity: 0;
			color: #ffffff;
			font-size: 20px;
			font-weight: normal;
			position: absolute;
			bottom: 220px;
		}
		.childss1 p{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 0 0 10px;
			margin-right: 28px;
			font-weight: normal;
			float: left;
			color: #ffffff;
			padding-bottom: 20px;
		}
		.childss1 i{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 15px 0 0;
			font-weight: normal;
			float: right;
			color: white;
			padding-bottom: 20px;
		}

	</style>
	<style>
		.product-cont2 .lunbo2{
			width: 100%;
			height: 150px;
			margin-top: -330px;
			margin-bottom: -100px;
			background-color: #f0f0f0;
		}
		.product-cont2  .cont-title2 {
			font-size: 20px;
			font-weight: 700;
			line-height: 50px;
			color: #00a346;
			padding-bottom: 50px;
			position: relative;
			text-align: center;
			padding-top: 50px;
		}
		.product-cont2{
			color: #00a346;
			cursor: pointer;
			padding-bottom: 0px;
		}
		.product-cont2 .cont-title2:after {
			content: '';
			display: block;
			width: 38px;
			border-bottom: 1px solid #000;
			position: absolute;
			left: calc(10% - 19px);
			/*margin-top: 10px;*/
		}
		.product-cont2 .product2 .product-list2 > p{
			text-align: left;
			font-size: 14px;
			line-height: 24px;
			color: #707070;
			padding: 0 30px;
		}
		.product-cont2 .product2 .product-list2 > p.product-text2{
			margin-bottom: 20px;
		}
		.in2 img {
			width: 50px;
			height: 50px;
			float: left;
			padding-left: 100px;
		}
		.in2 {
			width:5500px;
			padding-left: 1000px;
			position: absolute;
		}
		.out2 {
			width: 800px;
			height: 170px;
			overflow:hidden;
			margin: 0px auto;
			position: relative;

		}
		.left2 {
			width: 22px;
			height: 39px;
			left: 240px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			margin-top: -130px;
		}
		.right2 {
			width: 22px;
			height: 39px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			right: 240px;
			margin-top: -130px;
		}
		.in2 .pic02 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 120px;
			float: left;
		}
		.in2 .pic12 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic22 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic32 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic42 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic52 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic62 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic72 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic82 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic92 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic102 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/homepage/image/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic112 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic122 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic132 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in2 .pic142 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/3.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.childss2 {
			width: 150px;
			height: 0px;
			background-color:#000000;
			opacity: 0;
			color: #ffffff;
			font-size: 20px;
			font-weight: normal;
			position: absolute;
			bottom: 220px;
		}
		.childss2 p{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 0 0 10px;
			margin-right: 28px;
			font-weight: normal;
			float: left;
			color: #ffffff;
			padding-bottom: 20px;
		}
		.childss2 i{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 5px 0 0;
			font-weight: normal;
			float: right;
			color: white;
			padding-bottom: 20px;
		}

	</style>
	<style>
		.product-cont3 .lunbo3{
			width: 100%;
			height: 150px;
			margin-top: -330px;
			margin-bottom: -100px;
			background-color: #f0f0f0;
		}
		.product-cont3  .cont-title3 {
			font-size: 20px;
			font-weight: 700;
			line-height: 50px;
			color: #00a346;
			padding-bottom: 50px;
			position: relative;
			text-align: center;
			padding-top: 50px;
		}
		.product-cont3{
			color: #00a346;
			cursor: pointer;
			padding-bottom: 0px;
		}
		.product-cont3 .cont-title3:after {
			content: '';
			display: block;
			width: 38px;
			border-bottom: 1px solid #000;
			position: absolute;
			left: calc(10% - 19px);
			/*margin-top: 10px;*/
		}
		.product-cont3 .product3 .product-list3 > p{
			text-align: left;
			font-size: 14px;
			line-height: 24px;
			color: #707070;
			padding: 0 30px;
		}
		.product-cont3 .product3 .product-list3 > p.product-text3{
			margin-bottom: 20px;
		}
		.in3 img {
			width: 50px;
			height: 50px;
			float: left;
			padding-left: 100px;
		}
		.in3 {
			width:5500px;
			padding-left: 1000px;
			position: absolute;
		}
		.out3 {
			width: 800px;
			height: 170px;
			overflow:hidden;
			margin: 0px auto;
			position: relative;

		}
		.left3 {
			width: 22px;
			height: 39px;
			left: 240px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			margin-top: -130px;
		}
		.right3 {
			width: 22px;
			height: 39px;
			background-image: url(<%=path+"/images/6.jpg"%>);
			position: absolute;
			right: 240px;
			margin-top: -130px;
		}
		.in3 .pic03 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 120px;
			float: left;
		}
		.in3 .pic13 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic23 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic33 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic43 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic53 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic63 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic73 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic83 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic93 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic103 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic113 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic123 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic133 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.in3 .pic143 {
			display: block;
			background-color:#dbdbdb;
			width: 150px;
			height: 369px;
			background-image: url(<%=path+"/images/1.png"%>) ;
			background-size: 150px 150px;
			margin-left: 50px;
			float: left;
		}
		.childss3 {
			width: 150px;
			height: 0px;
			background-color:#000000;
			opacity: 0;
			color: #ffffff;
			font-size: 20px;
			font-weight: normal;
			position: absolute;
			bottom: 220px;
		}
		.childss3 p{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 0 0 10px;
			margin-right: 28px;
			font-weight: normal;
			float: left;
			color: #ffffff;
			padding-bottom: 20px;
		}
		.childss3 i{
			font-family: Segoe UI;
			font-size: 15px;
			padding: 0px 15px 0 0;
			font-weight: normal;
			float: right;
			color: white;
			padding-bottom: 20px;
		}

	</style>

<%--	公告css--%>
	<style type="text/css">
		#container_small_tip{
			background:#EBEEF7;
			position:relative;
			overflow:hidden;
			width:600px;
			height:36px;
			float: right;
			line-height:36px;
			/* margin:100px; */
		}

		#content_small_tip{
			position:absolute;
			left:0;
			top:0;
			white-space:nowrap;
			color: #EBEEF7;/*与背景颜色相同，先隐藏，需要时再变颜色*/
		}


	</style>
</head>
<body>
<div class="topDiv">
	<div class="mainWarp">
		<div class="topLeft">
			<span>地区频道：</span>
			<a href="javascript:void()">广州</a>
			<a href="javascript:void()">深圳</a>
			<a href="javascript:void()">珠海</a>
			<a href="javascript:void()">汕头</a>
			<a href="javascript:void()">韶关</a>
			<a href="javascript:void()">河源</a>
			<a href="javascript:void()">广州</a>
			<a href="javascript:void()">深圳</a>
			<a href="javascript:void()">珠海</a>
			<label style="float: right;font-size: 18px">好消息：</label>
		</div>
		<div class="topRight  ">


			<div id="container_small_tip">

				<div id="content_small_tip"></div>
			</div>
			<script type="text/javascript">
				$("#content_small_tip")[0].innerHTML = "北京第三区交通委提醒您：道路千万条，安全第一条，行车不规范，亲人两行泪。";
				(function ($) {
					$.fn.extend({
						roll: function (options) {
							var defaults = {
								speed: 1
							};
							var options = $.extend(defaults, options);
							var speed = (document.all) ? options.speed : Math.max(1, options.speed - 1);
							if ($(this) == null) return;
							var $container = $(this);
							var $content = $("#content_small_tip");
							var init_left = $container.width();
							$content.css({ left: parseInt(init_left) + "px" });
							var This = this;
							var time = setInterval(function () { This.move($container, $content, speed); }, 20); //setInterval会改变this指向，即使加了This=this，也要用匿名函数封装

							$container.bind("mouseover", function () {
								clearInterval(time);
							});
							$container.bind("mouseout", function () {
								time = setInterval(function () { This.move($container, $content, speed); }, 20);
							});
							// setTimeout(function () { $("#container").slideUp(); }, 30000);  //毫秒单位，显示30s后消失
							return this;
						},
						move: function ($container, $content, speed) {
							var container_width = $container.width();
							var content_width = $content.width();
							if (parseInt($content.css("left")) + content_width > 0) {
								$content.css({ left: parseInt($content.css("left")) - speed + "px" });
								$content.css({color:"#02A0E9"})//改变字体颜色
							}
							else {
								$content.css({ left: parseInt(container_width) + "px" });
								$content.css({color:"#02A0E9"})//改变字体颜色
							}
						}
					});
				})(jQuery);
				//插件的调用$("#yourId").roll({speed:#yourSpeed});
				$(document).ready(
					function () {
						$("#container_small_tip").roll({ speed: 2 });
					}
				);


			</script>
		</div>
	</div>
</div>
<div class="loginDiv">
	<div class="loginL">
		<img src="${pageContext.request.contextPath}/images/LOGO.png" />
		<img src="${pageContext.request.contextPath}/images/view_logo40.png" />
	</div>
	<div class="loginAddress">
		<div class="add1">
			<!-- 在输入框加入id -->
			<input type="text" class="cityinput layui-input city"  id="citySelect" placeholder="输入城市">
			<script type="text/javascript">
				var test=new Vcity.CitySelector({input:'citySelect'});
			</script>
		</div>
	</div>
	<div class="loginC">
		<input name="" type="text" placeholder="请填写关键词或选择职位..." />
		<button class="layui-btn" style="margin:0 0 3px 39px;height: 44px;width: 115px;background-color:transparent"></button>
	</div>

	<div class="loginR">
		<img src="${pageContext.request.contextPath}/images/spirit_40.png" />
	</div>
</div>
<div class="menuDiv">
	<a href="${pageContext.request.contextPath}/user/homepage" class="onnav">首页</a>
	<a href="searchJob.html">找工作</a>
	<a href="meetingJob.html">技术成长</a>
	<a href="jobnews.html">就业资讯</a>
	<a href="download.html">个人中心</a>
	<a href="javascript:void()" class="mobile">登录</a>
	<a href="helpJob.html">注册</a>
</div>
<div class="BodyMain">
	<div class="mainTop">
<%--		<div class="mainTopL">--%>
<%--			<ul>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme1"><b></b>销售|市场|客服|贸易</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme2"><b></b>经营管理|人事|行政|财务</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme3"><b></b>生产|质管|技工|物流</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme4"><b></b>教育|法律|咨询|翻译</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme5"><b></b>零售|家政|餐饮|旅游</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme6"><b></b>广告|媒体|艺术|出版</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme7"><b></b>IT|互联网|通信</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme8"><b></b>金融|保险</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme9"><b></b>医疗|制药|环保|化工</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme10"><b></b>建筑|房地产|物业管理</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme11"><b></b>电子|能源|机械|纺织</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="items">--%>
<%--					<div class="itemOne">--%>
<%--						<span class="itme12"><b></b>农业|实习生|科研</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div class="mainTopR">
<%--	中间轮播广告--%>
			<div class="ads">
				<!--            <div class="floatL" id="left"></div>-->
				<div class="adBox0">
					<div class="layui-carousel " id="test10">
						<div carousel-item="">
							<div style="background:url(<%=path+"/images/1.jpg"%>);background-size: 800px;background-repeat: no-repeat;background-position: center"></div>
							<div style="background:url(<%=path+"/images/2.jpg"%>);background-size: cover;background-repeat: no-repeat;background-position: center"></div>
							<div style="background:url(<%=path+"/images/3.gif"%>);background-size: cover;background-repeat: no-repeat;background-position: center"></div>

						</div>
					</div>
					<script>
						layui.use(['carousel', 'form'], function() {
							var carousel = layui.carousel
								, form = layui.form;
							//图片轮播
							carousel.render({
								elem: '#test10'
								,width: '800px'
								,height: '272px'
								,interval: 1500
							});

						});
					</script>


					<!--              <ul style="margin-left: 0px; overflow: hidden">-->
					<!--                <li>-->
					<!--                  <a href="javascript:void()"><div style="background:url(images/1.jpg);background-size: cover;background-repeat: no-repeat;background-position: center"></div></a>-->
					<!--                </li>-->
					<!--                <li>-->
					<!--                  <a href="javascript:void()"><div style="background:url(images/2.jpg);background-size: cover;background-repeat: no-repeat;background-position: center"></div></a>-->
					<!--                </li>-->
					<!--                <li>-->
					<!--                  <a href="javascript:void()"><div style="background:url(images/3.gif);background-size: cover;background-repeat: no-repeat;background-position: center"></div></a>-->
					<!--                </li>-->
					<!--              </ul>-->
				</div>
				<!--            <div class="floatR" id="right"></div>-->
				<!--            <div class="clear"> </div>-->
			</div>


			<div class="login">
<%--				<div class="erweima">--%>
<%--					<div class="close"></div>--%>
<%--					<div class="ewmimg"><img src="images/showqrcode.jpg" /></div>--%>
<%--					<div class="ewmtxt">使用微信扫描上方二维码登录</div>--%>
<%--				</div>--%>
<%--				<div class="logintop">--%>
<%--					<div class="loginC loginA select">--%>
<%--						<div class="smlogin"></div>--%>
<%--						<span>个人登录</span>--%>
<%--					</div>--%>
<%--					<div class="loginC loginB">--%>
<%--						<span>企业登录</span>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="loginmain">--%>
<%--					<div class="ContentA">--%>
<%--						<div class="txtInput"><input name="" type="text" placeholder="请输入用户名"/></div>--%>
<%--						<div class="txtInput"><input name="" type="text" placeholder="请输入密码"/></div>--%>
<%--						<div class="txtbtn">--%>
<%--							<div style="float:left">--%>
<%--								<span class="chebox yes"></span>--%>
<%--								<a href="javascript:void()" class="a1">接受用户协议</a>--%>
<%--								<br /><div class="clear"></div>--%>
<%--								<span class="chebox yes"></span>--%>
<%--								<span>记住我</span>--%>
<%--								<a href="javascript:void()" class="a2">忘记密码</a>--%>
<%--							</div>--%>
<%--							<input name="" type="button" class="lobtn" value="登  录"/>--%>
<%--						</div>--%>
<%--						<div class="zcbox">--%>
<%--							<div class="zc1"></div>--%>
<%--							<div class="zc2">--%>
<%--								<a href="javascript:void()" class="a1">一分钟填写简历</a>--%>
<%--								<a href="javascript:void()" class="a2">注册</a>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<div class="ContentB">--%>
<%--						<div class="qybox1">--%>
<%--							<a href="javascript:void()">企业登录</a>--%>
<%--							<a href="javascript:void()">企业注册</a>--%>
<%--						</div>--%>
<%--						<div class="qybox2">--%>
<%--							<p>注册后可<b>免费</b>升级为<b>普通会员</b><br>不花钱也能完成中低职位的招聘</p>--%>
<%--						</div>--%>
<%--						<div class="qybox3">--%>
<%--							<div class="l">企业服务热线<br><b>400-800-8*8*</b></div>--%>
<%--							<div class="r"></div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
			</div>
			<div class="clear"></div>
<%--	专区模块--%>
			<div class="tabs">
				<ul id="tab">
					<li class="current">技术成长专区</li>
					<li>高校专区</li>
					<li>名企专区</li>
					<li  style="float: right;width: 242px">成果展示</li>
				</ul>
				<div id="content">
					<ul style="display:block;">
						<div class="product-cont">
		<div class="scene2">
			<div class="out">
				<div class="in clearFix" style="left: -1100px;">
					<div class="pic">
						<div class="childss test">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic1">
						<div class="childss test1">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic2">
						<div class="childss test2">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<!-- 第二组 -->
					<div class="pic3">
						<div class="childss test3">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic4">
						<div class="childss test4">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic5">
						<div class="childss test5">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<!-- 第三组 -->
					<div class="pic6">
						<div class="childss test6">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic7">
						<div class="childss test7">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic8">
						<div class="childss test8">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<!-- 第四组 -->
					<div class="pic9">
						<div class="childss test9">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic10">
						<div class="childss test10">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic11">
						<div class="childss test11">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<!-- 第五组 -->
					<div class="pic12">
						<div class="childss test12">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic13">
						<div class="childss test13">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>
					<div class="pic14">
						<div class="childss test14">
							<p>就业总数</p>
							<i>1999</i>
						</div>
					</div>

				</div>
				<div class="shodow"></div>
			</div>
		</div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="lunbo"></div>
	</div>
						<script>

		//轮播
		var out = document.getElementsByClassName("out").item(0);
		var left = document.getElementsByClassName("left").item(0);
		var right = document.getElementsByClassName("right").item(0);
		var myin = document.getElementsByClassName("in").item(0);
		var zt = true;
		var timer = null;
		// var lilist = document.getElementsByTagName("li");
		var index1 = 0;
		var timer1 = null;
		right.onclick = function () {
			if (zt == true) {
				move(-800);
			}
		};
		left.onclick = function () {
			if (zt == true) {
				move(800);
			}
		};
		function move(dis) {
			zt = false;
			var newweizhi = parseInt(myin.style.left) + dis;

			var time = 1000;
			var interval = 10;
			var every = dis / (time / interval);
			function meici() {
				if (every < 0 && parseInt(myin.style.left) > newweizhi || every > 0 && parseInt(myin.style.left) < newweizhi) {
					myin.style.left = parseInt(myin.style.left) + every + 'px';
					setTimeout(meici, 10)
				} else {
					myin.style.left = newweizhi + 'px';
					clearInterval(timer);
					zt = true;
					if (newweizhi == -4300) {
						myin.style.left = -1100 + "px";
					}
					if (newweizhi == -300) {
						myin.style.left = -1100 + "px";
					}

				}
			}
			meici();
		}

		timer1 = setInterval(right.onclick, 3000);
		out.onmouseover = function () {
			clearInterval(timer1);
		};
		left.onmouseover = function () {
			clearInterval(timer1);
		};
		right.onmouseover = function () {
			clearInterval(timer1);
		};
		out.onmouseout = function () {
			timer1 = setInterval(right.onclick, 3000);
		}
		left.onmouseout = function () {
			timer1 = setInterval(right.onclick, 3000);
		};
		right.onmouseout = function () {
			timer1 = setInterval(right.onclick, 3000);
		};
		// 鼠标移进一出
		$(document).ready(function () {
			var animated = false;
			$(".pic").mouseenter(function () {
				$(".test").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic").mouseleave(function () {
				$(".test").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic1").mouseenter(function () {
				$(".test1").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic1").mouseleave(function () {
				$(".test1").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic2").mouseenter(function () {
				$(".test2").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic2").mouseleave(function () {
				$(".test2").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})

			$(".pic4").mouseenter(function () {
				$(".test4").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic4").mouseleave(function () {
				$(".test4").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic3").mouseenter(function () {

				$(".test3").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic3").mouseleave(function () {
				$(".test3").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic5").mouseenter(function () {
				// $('.test5').animate({ 'height': '67px', opacity: '0.5' }, "slow");
				$(".test5").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic5").mouseleave(function () {
				$(".test5").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic6").mouseenter(function () {
				$(".test6").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic6").mouseleave(function () {
				$(".test6").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic7").mouseenter(function () {
				$(".test7").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic7").mouseleave(function () {
				$(".test7").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic8").mouseenter(function () {
				$(".test8").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic8").mouseleave(function () {

				$(".test8").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic9").mouseenter(function () {
				//$('.test9').animate({ 'height': '67px', opacity: '0.5' }, "slow");
				$(".test9").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic9").mouseleave(function () {
				// $('.test9').animate({ 'height': '0px', opacity: '0' }, "slow");
				$(".test9").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic10").mouseenter(function () {
				//$('.test10').animate({ 'height': '67px', opacity: '0.5' }, "slow");
				$(".test10").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic10").mouseleave(function () {
				// $('.test10').animate({ 'height': '0px', opacity: '0' }, "slow");
				$(".test10").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
			$(".pic11").mouseenter(function () {
				//$('.test11').animate({ 'height': '67px', opacity: '0.5' }, "slow");
				$(".test11").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
			});
			$(".pic11").mouseleave(function () {
				// $('.test11').animate({ 'height': '0px', opacity: '0' }, "slow");
				$(".test11").stop().animate({ 'height': '0px', opacity: '0' },"slow");
			})
		});
	</script>
					</ul>

					<ul>
						<div class="product-cont1">
							<div class="scene2">
								<div class="out1">
									<div class="in1 clearFix1" style="left: -1100px;">
										<div class="pic0">
											<div class="childss1 test0">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic11">
											<div class="childss1 test11">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic21">
											<div class="childss1 test21">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第二组 -->
										<div class="pic31">
											<div class="childss1 test31">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic41">
											<div class="childss1 test41">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic51">
											<div class="childss1 test51">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第三组 -->
										<div class="pic61">
											<div class="childss1 test61">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic71">
											<div class="childss1 test71">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic81">
											<div class="childss1 test81">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第四组 -->
										<div class="pic91">
											<div class="childss1 test91">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic101">
											<div class="childss1 test101">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic111">
											<div class="childss1 test111">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第五组 -->
										<div class="pic121">
											<div class="childss1 test121">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic131">
											<div class="childss1 test131">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic141">
											<div class="childss1 test141">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>

									</div>
									<div class="shodow1"></div>
								</div>
							</div>
							<div class="left1"></div>
							<div class="right1"></div>
							<div class="lunbo1"></div>
						</div>
						<script>

							//轮播
							var out1 = document.getElementsByClassName("out1").item(0);
							var left1 = document.getElementsByClassName("left1").item(0);
							var right1 = document.getElementsByClassName("right1").item(0);
							var myin1 = document.getElementsByClassName("in1").item(0);
							var zt1 = true;
							var timer1 = null;
							// var lilist = document.getElementsByTagName("li");
							var index11 = 0;
							var timer11 = null;
							right1.onclick = function () {
								if (zt1 == true) {
									move1(-800);
								}
							};
							left1.onclick = function () {
								if (zt1 == true) {
									move1(800);
								}
							};
							function move1(dis) {
								zt1 = false;
								var newweizhi1 = parseInt(myin1.style.left) + dis;

								var time1 = 1000;
								var interval1 = 10;
								var every1 = dis / (time1 / interval1);
								function meici1() {
									if (every1 < 0 && parseInt(myin1.style.left) > newweizhi1 || every1 > 0 && parseInt(myin1.style.left) < newweizhi1) {
										myin1.style.left = parseInt(myin1.style.left) + every1 + 'px';
										setTimeout(meici1, 10)
									} else {
										myin1.style.left = newweizhi1 + 'px';
										clearInterval(timer1);
										zt1 = true;
										if (newweizhi1 == -4300) {

											myin1.style.left = -1100 + "px";
										}
										if (newweizhi1 == -300) {

											myin1.style.left = -1100 + "px";
										}

									}
								}
								meici1();
							}

							timer11 = setInterval(right1.onclick, 3000);
							out1.onmouseover = function () {
								clearInterval(timer11);
							};
							left1.onmouseover = function () {
								clearInterval(timer11);
							};
							right1.onmouseover = function () {
								clearInterval(timer11);
							};
							out1.onmouseout = function () {
								timer11 = setInterval(right1.onclick, 3000);
							}
							left1.onmouseout = function () {
								timer1 = setInterval(right1.onclick, 3000);
							};
							right1.onmouseout = function () {
								timer11 = setInterval(right1.onclick, 3000);
							};



							// 鼠标移进一出
							$(document).ready(function () {
								var animated = false;
								$(".pic0").mouseenter(function () {
									$(".test0").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic0").mouseleave(function () {
									$(".test0").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic11").mouseenter(function () {
									$(".test11").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic11").mouseleave(function () {
									$(".test11").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic21").mouseenter(function () {
									$(".test21").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic21").mouseleave(function () {
									$(".test21").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic41").mouseenter(function () {
									// $('.test4').animate({ height: '67px', width:'300px',opacity: '0.5' }, "slow");
									// $('.test4').animate({'height':'67px','marginTop':'303px',opacity: '0.5' }, "slow");
									// $('.test4').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									//$('.test4').animate({'width':'300px','right':'300px',opacity: '0.5' }, "slow");
									$(".test41").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic41").mouseleave(function () {
									// $('.test4').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test41").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic31").mouseenter(function () {
									// if (!animated) {
									//         animated=true;
									//         $(".test3").animate({ 'height': '67px', opacity: '0.5' }, "slow", function () {
									//             animated=false;
									//         });
									//     }
									$(".test31").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
									// $('.test3').animate({ 'height': '67px', opacity: '0.5' }, "slow");
								});
								$(".pic31").mouseleave(function () {
									$(".test31").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
									//$('.test3').animate({ 'height': '0px', opacity: '0' }, "slow");
								})
								$(".pic51").mouseenter(function () {
									// $('.test5').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test51").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic51").mouseleave(function () {
									// $('.test5').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test51").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic61").mouseenter(function () {
									//$('.test6').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test61").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic61").mouseleave(function () {
									//$('.test6').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test61").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic71").mouseenter(function () {
									//$('.test7').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test71").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic71").mouseleave(function () {
									// $('.test7').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test71").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic81").mouseenter(function () {
									//$('.test8').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test81").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic81").mouseleave(function () {
									// $('.test8').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test81").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic91").mouseenter(function () {
									//$('.test9').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test91").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic91").mouseleave(function () {
									// $('.test9').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test91").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic101").mouseenter(function () {
									//$('.test10').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test101").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic101").mouseleave(function () {
									// $('.test10').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test101").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic111").mouseenter(function () {
									//$('.test11').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test111").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic111").mouseleave(function () {
									// $('.test11').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test111").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
							});
						</script>
					</ul>

					<ul>
						<div class="product-cont2">
							<div class="scene2">
								<div class="out2">
									<div class="in2 clearFix2" style="left: -1100px;">
										<div class="pic02">
											<div class="childss2 test02">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic12">
											<div class="childss2 test12">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic22">
											<div class="childss2 test22">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<!-- 第二组 -->
										<div class="pic32">
											<div class="childss2 test32">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic42">
											<div class="childss2 test42">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic52">
											<div class="childss2 test52">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<!-- 第三组 -->
										<div class="pic62">
											<div class="childss2 test62">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic72">
											<div class="childss2 test72">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic82">
											<div class="childss2 test82">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<!-- 第四组 -->
										<div class="pic92">
											<div class="childss2 test92">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic102">
											<div class="childss2 test102">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic112">
											<div class="childss2 test112">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<!-- 第五组 -->
										<div class="pic122">
											<div class="childss2 test122">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic132">
											<div class="childss2 test132">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>
										<div class="pic142">
											<div class="childss2 test142">
												<p>招收总人数</p>
												<i>999</i>
											</div>
										</div>

									</div>
									<div class="shodow2"></div>
								</div>
							</div>
							<div class="left2"></div>
							<div class="right2"></div>
							<div class="lunbo2"></div>
						</div>
						<script>

							//轮播
							var out2 = document.getElementsByClassName("out2").item(0);
							var left2 = document.getElementsByClassName("left2").item(0);
							var right2 = document.getElementsByClassName("right2").item(0);
							var myin2 = document.getElementsByClassName("in2").item(0);
							var zt2 = true;
							var timer2 = null;
							// var lilist = document.getElementsByTagName("li");
							var index12 = 0;
							var timer12 = null;
							right2.onclick = function () {
								if (zt2 == true) {
									move2(-800);
								}
							};
							left2.onclick = function () {
								if (zt2 == true) {
									move2(800);
								}
							};
							function move2(dis) {
								zt2 = false;
								var newweizhi2 = parseInt(myin2.style.left) + dis;
								var time2 = 1000;
								var interval2 = 10;
								var every2 = dis / (time2 / interval2);
								function meici2() {
									if (every2 < 0 && parseInt(myin2.style.left) > newweizhi2 || every2 > 0 && parseInt(myin2.style.left) < newweizhi2) {
										myin2.style.left = parseInt(myin2.style.left) + every2 + 'px';
										setTimeout(meici2, 10)
									} else {
										myin2.style.left = newweizhi2 + 'px';
										clearInterval(timer2);
										zt2 = true;
										if (newweizhi2 == -4300) {

											myin2.style.left = -1100 + "px";
										}
										if (newweizhi2 == -300) {

											myin2.style.left = -1100 + "px";
										}

									}
								}
								meici2();
							}

							timer12 = setInterval(right2.onclick, 3000);
							out2.onmouseover = function () {
								clearInterval(timer12);
							};
							left2.onmouseover = function () {
								clearInterval(timer12);
							};
							right2.onmouseover = function () {
								clearInterval(timer12);
							};
							out2.onmouseout = function () {
								timer12 = setInterval(right2.onclick, 3000);
							}
							left2.onmouseout = function () {
								timer12 = setInterval(right2.onclick, 3000);
							};
							right2.onmouseout = function () {
								timer12 = setInterval(right2.onclick, 3000);
							};



							// 鼠标移进一出
							$(document).ready(function () {
								var animated2= false;
								$(".pic02").mouseenter(function () {
									$(".test02").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic02").mouseleave(function () {
									$(".test02").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic12").mouseenter(function () {
									$(".test12").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic12").mouseleave(function () {
									$(".test12").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic22").mouseenter(function () {
									$(".test22").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic22").mouseleave(function () {
									$(".test22").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic42").mouseenter(function () {
									// $('.test4').animate({ height: '67px', width:'300px',opacity: '0.5' }, "slow");
									// $('.test4').animate({'height':'67px','marginTop':'303px',opacity: '0.5' }, "slow");
									// $('.test4').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									//$('.test4').animate({'width':'300px','right':'300px',opacity: '0.5' }, "slow");
									$(".test42").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic42").mouseleave(function () {
									// $('.test4').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test42").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic32").mouseenter(function () {
									// if (!animated) {
									//         animated=true;
									//         $(".test3").animate({ 'height': '67px', opacity: '0.5' }, "slow", function () {
									//             animated=false;
									//         });
									//     }
									$(".test32").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
									// $('.test3').animate({ 'height': '67px', opacity: '0.5' }, "slow");
								});
								$(".pic32").mouseleave(function () {
									$(".test32").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
									//$('.test3').animate({ 'height': '0px', opacity: '0' }, "slow");
								})
								$(".pic52").mouseenter(function () {
									// $('.test5').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test52").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic52").mouseleave(function () {
									// $('.test5').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test52").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic62").mouseenter(function () {
									//$('.test6').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test62").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic62").mouseleave(function () {
									//$('.test6').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test62").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic72").mouseenter(function () {
									//$('.test7').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test72").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic72").mouseleave(function () {
									// $('.test7').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test72").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic82").mouseenter(function () {
									//$('.test8').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test82").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic82").mouseleave(function () {
									// $('.test8').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test82").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic92").mouseenter(function () {
									//$('.test9').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test92").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic92").mouseleave(function () {
									// $('.test9').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test92").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic102").mouseenter(function () {
									//$('.test10').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test102").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic102").mouseleave(function () {
									// $('.test10').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test102").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic112").mouseenter(function () {
									//$('.test11').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test112").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic112").mouseleave(function () {
									// $('.test11').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test112").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic132").mouseenter(function () {
									//$('.test9').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test132").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic132").mouseleave(function () {
									// $('.test9').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test132").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic142").mouseenter(function () {
									//$('.test10').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test142").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic142").mouseleave(function () {
									// $('.test10').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test142").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic122").mouseenter(function () {
									//$('.test11').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test122").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic122").mouseleave(function () {
									// $('.test11').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test122").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
							});
						</script>
					</ul>
					<ul style="display:block;">
						<div class="product-cont3">
							<div class="scene2">
								<div class="out3">
									<div class="in3 clearFix3" style="left: -1100px;">
										<div class="pic03">
											<div class="childss3 test03">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic13">
											<div class="childss3 test13">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic23">
											<div class="childss3 test23">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第二组 -->
										<div class="pic33">
											<div class="childss3 test33">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic43">
											<div class="childss3 test43">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic53">
											<div class="childss3 test53">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第三组 -->
										<div class="pic63">
											<div class="childss3 test63">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic73">
											<div class="childss3 test73">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic83">
											<div class="childss3 test83">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第四组 -->
										<div class="pic93">
											<div class="childss3 test93">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic103">
											<div class="childss3 test103">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic113">
											<div class="childss3 test113">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<!-- 第五组 -->
										<div class="pic123">
											<div class="childss3 test123">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic133">
											<div class="childss3 test133">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>
										<div class="pic143">
											<div class="childss3 test143">
												<p>就业总数</p>
												<i>1999</i>
											</div>
										</div>

									</div>
									<div class="shodow3"></div>
								</div>
							</div>
							<div class="left3"></div>
							<div class="right3"></div>
							<div class="lunbo3"></div>
						</div>
						<script>

							//轮播
							var out3 = document.getElementsByClassName("out3").item(0);
							var left3 = document.getElementsByClassName("left3").item(0);
							var right3 = document.getElementsByClassName("right3").item(0);
							var myin3 = document.getElementsByClassName("in3").item(0);
							var zt3 = true;
							var timer3 = null;
							// var lilist = document.getElementsByTagName("li");
							var index13 = 0;
							var timer13 = null;
							right3.onclick = function () {
								if (zt3 == true) {
									move3(-800);
								}
							};
							left3.onclick = function () {
								if (zt3 == true) {
									move3(800);
								}
							};
							function move3(dis) {
								zt3 = false;
								var newweizhi3 = parseInt(myin3.style.left) + dis;

								var time3 = 1000;
								var interval3 = 10;
								var every3 = dis / (time3 / interval3);
								function meici3() {
									if (every3 < 0 && parseInt(myin3.style.left) > newweizhi3 || every3 > 0 && parseInt(myin3.style.left) < newweizhi3) {
										myin3.style.left = parseInt(myin3.style.left) + every3 + 'px';
										setTimeout(meici3, 10)
									} else {
										myin3.style.left = newweizhi3 + 'px';
										clearInterval(timer3);
										zt3 = true;
										if (newweizhi3 == -4300) {
											myin3.style.left = -1100 + "px";
										}
										if (newweizhi3 == -300) {
											myin3.style.left = -1100 + "px";
										}

									}
								}
								meici3();
							}

							timer13 = setInterval(right3.onclick, 3000);
							out3.onmouseover = function () {
								clearInterval(timer13);
							};
							left3.onmouseover = function () {
								clearInterval(timer13);
							};
							right3.onmouseover = function () {
								clearInterval(timer13);
							};
							out3.onmouseout = function () {
								timer13 = setInterval(right3.onclick, 3000);
							}
							left3.onmouseout = function () {
								timer13 = setInterval(right3.onclick, 3000);
							};
							right3.onmouseout = function () {
								timer13 = setInterval(right3.onclick, 3000);
							};
							// 鼠标移进一出
							$(document).ready(function () {
								var animated = false;
								$(".pic03").mouseenter(function () {
									$(".test03").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic03").mouseleave(function () {
									$(".test03").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic13").mouseenter(function () {
									$(".test13").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic13").mouseleave(function () {
									$(".test13").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic23").mouseenter(function () {
									$(".test23").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic23").mouseleave(function () {
									$(".test23").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})

								$(".pic43").mouseenter(function () {
									$(".test43").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic43").mouseleave(function () {
									$(".test43").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic33").mouseenter(function () {

									$(".test33").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic33").mouseleave(function () {
									$(".test33").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic53").mouseenter(function () {
									// $('.test5').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test53").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic53").mouseleave(function () {
									$(".test53").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic63").mouseenter(function () {
									$(".test63").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic63").mouseleave(function () {
									$(".test63").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic73").mouseenter(function () {
									$(".test73").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic73").mouseleave(function () {
									$(".test73").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic83").mouseenter(function () {
									$(".test83").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic83").mouseleave(function () {

									$(".test83").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic93").mouseenter(function () {
									//$('.test9').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test93").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic93").mouseleave(function () {
									// $('.test9').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test93").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic103").mouseenter(function () {
									//$('.test10').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test103").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic103").mouseleave(function () {
									// $('.test10').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test103").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic113").mouseenter(function () {
									//$('.test11').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test113").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic113").mouseleave(function () {
									// $('.test11').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test113").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic123").mouseenter(function () {
									//$('.test9').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test123").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic123").mouseleave(function () {
									// $('.test9').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test123").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic133").mouseenter(function () {
									//$('.test10').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test133").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic133").mouseleave(function () {
									// $('.test10').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test133").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic143").mouseenter(function () {
									//$('.test11').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									$(".test143").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic143").mouseleave(function () {
									// $('.test11').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test143").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
							});
						</script>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>

	<div class="mainCon2">
		<div class="commontitdiv">
			<div class="title">高薪职位</div>
			<span>高薪就这么任性！</span>
		</div>
		<div class="clear"></div>
		<div class="highMoney">
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
		</div>
	</div>
	<div class="mainCon3">
		<div class="commontitdiv">
			<div class="title">推荐职位</div>
			<span class="line"></span>
		</div>
		<div class="clear"></div>
		<div class="tuijian">
			<ul>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
			</ul>
			<div class="linediv"></div>
			<ul>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
			</ul>
			<div class="linediv"></div>
			<ul>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
			</ul>
			<div class="more"><a href="javascript:void()">更多>></a></div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mainCon4">
		<ul>
			<li>
				<img src="${pageContext.request.contextPath}/images/19.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/20.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州市富壹贷投资咨询有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/21.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/22.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/23.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/24.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/25.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/26.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/27.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/28.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/19.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/20.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州市富壹贷投资咨询有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/21.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/22.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/23.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
	<div class="mainCon5">
		<div class="main5left">
			<div class="Info">
				<a href="javascript:void()" class="infoimg"><img src="${pageContext.request.contextPath}/images/29.GIF" width="213" height="123"/></a>
				<div class="infocon">
					<p class="Title2"><span>精彩专题</span> <a href="javascript:void()">开弓没有回头箭，齐心协力勇者前！</a> </p>
					<p class="Detail"><a href="javascript:void()">年末将至，被各种年度数据总结压的喘不过气来！忙中偷闲和小伙伴们来到射箭俱乐部，体验了一把射箭的快感，将疲劳压力神马的，顿时一扫而光！射箭，即箭术，助弓的弹力将箭射出，在一定的距离内比赛准确性的体育运动项目，为射箭运动。</a></p>
				</div>
			</div>
			<div class="Info">
				<a href="javascript:void()" class="infoimg"><img src="${pageContext.request.contextPath}/images/30.jpg" width="213" height="123"/></a>
				<div class="infocon">
					<p class="Title2"><span class="sspan">职场资讯</span> <a href="javascript:void()">17省市提高最低工资 京沪等4地进入2000元大关</a> </p>
					<p class="Detail"><a href="javascript:void()">2017年提高最低工资标准的地区数量较去年大幅增加。据不完全统计，目前至少已有17个地区公布了2017年最低工资标准。其中，上海、深圳、天津、北京的月最低工资标准≥2000元。17地区提高最低工资标准</a></p>
				</div>
			</div>
		</div>
		<div class="main5rigth">
			<div class="title">
				<span>常用文档下载</span>
				<a href="javascript:void()">更多</a>
			</div>
			<div class="content">
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="line"></div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mainCon6">
		<div class="commontitdiv">
			<div class="title">友情链接</div>
			<span class="line"></span>
		</div>
		<div class="clear"></div>
		<div class="contnt6">
			<ul>
				<li><a href="javascript:void()">火电招聘网</a></li>
				<li><a href="javascript:void()">校园招聘</a></li>
				<li><a href="javascript:void()">2018校园招聘</a></li>
				<li><a href="javascript:void()">打工网</a></li>
				<li><a href="javascript:void()">找工作</a></li>
				<li><a href="javascript:void()">黄山人才网</a></li>
				<li><a href="javascript:void()">南通人才网</a></li>
				<li><a href="javascript:void()">深圳人才网</a></li>
				<li><a href="javascript:void()">广州人才网</a></li>
				<li><a href="javascript:void()">信阳招聘网</a></li>
				<li><a href="javascript:void()">物流人才网</a></li>
				<li><a href="javascript:void()">医药招聘网</a></li>
				<li><a href="javascript:void()">黄山人才网</a></li>
				<li><a href="javascript:void()">南通人才网</a></li>
				<li><a href="javascript:void()">深圳人才网</a></li>
				<li><a href="javascript:void()">广州人才网</a></li>
				<li><a href="javascript:void()">信阳招聘网</a></li>
				<li><a href="javascript:void()">物流人才网</a></li>
				<li><a href="javascript:void()">医药招聘网</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="footerLine"></div>
<div class="footer">
	<div class="footertop">
		<div class="footl">
			<div class="footlbox">
				<p>关于蝶飞人才网</p>
				<a href="javascript:void()">关于我们</a>
				<a href="javascript:void()">网站大事记</a>
				<a href="javascript:void()">视频展示</a>
				<a href="javascript:void()">媒体动态</a>
				<a href="javascript:void()">联系我们</a>
				<a href="javascript:void()">网站声明</a>
			</div>
			<div class="footlbox">
				<p>个人求职</p>
				<a href="javascript:void()">查工资</a>
				<a href="javascript:void()">注册/登录 </a>
				<a href="javascript:void()">职位搜索</a>
				<a href="javascript:void()">兼职招聘</a>
				<a href="javascript:void()">手机找工作</a>
			</div>
			<div class="footlbox">
				<p>企业招聘</p>
				<a href="javascript:void()">注册/登录</a>
				<a href="javascript:void()">资费标准</a>
				<a href="javascript:void()">掌中招聘 </a>
			</div>
			<div class="footlbox">
				<p>资讯中心</p>
				<a href="javascript:void()">招聘会</a>
				<a href="javascript:void()">校园招聘</a>
				<a href="javascript:void()">就业资讯</a>
				<a href="javascript:void()">文档下载</a>
			</div>
			<div class="footlbox">
				<p>快速导航</p>
				<a href="javascript:void()">网站地图</a>
				<a href="javascript:void()">职位地图</a>
				<a href="javascript:void()">热门搜索</a>
				<a href="javascript:void()">专业搜索</a>
				<a href="http://www.bootstrapmb.com">推广入口</a>
			</div>
		</div>
		<div class="footr">
			<div class="fr1">400-8**-****</div>
			<div class="fr2">每周一至周日 8:30-17:30</div>
			<div class="fr3">
				<span><img src="${pageContext.request.contextPath}/images/showqrcode.jpg" /><br />个人安卓客户端</span>
				<span><img src="${pageContext.request.contextPath}/images/showqrcode.jpg" /><br />企业安卓客户端</span>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="footerdown">
		<div class="ssdiv">
			<input name="" type="text" placeholder="请输入关键词" class="sstxt"/>
			<input name="" type="button" value="搜索" class="ssbtn"/>
		</div>
		<div class="clear"></div>
		<div class="subdiv">
			<span>人才生态圈是***权威的专业求职招聘网站，涵盖***人才网，**人才招聘网，提供**人才网招聘信息、**人才市场信息等服务！</span>
			<span>版权所有:人才生态圈本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</span>
			<span>京ICP备*****号 京ICP备*****号<a href="javascript:void()">京ICP备*****号</a>
        <a href="javascript:void()">京ICP证0******9号</a>
        <a href="javascript:void()">沪ICP备****1号</a>
        <a href="javascript:void()"></a>
        <a href="javascript:void()" class="aimg"><img src="${pageContext.request.contextPath}/images/gongan.png" />京公网安备8*25******</a></span>
		</div>
		<div class="clear"></div>
		<div class="ffotdiv">
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/3.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">中国互联网协会理事成员</a></div>
			</div>
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/4.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">工信部网站备案信息</a></div>
			</div>
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/5.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">上海人才服务行业协会会员</a></div>
			</div>
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/6.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">北京人力资源行业协会会员</a></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>





</body>
</html>
