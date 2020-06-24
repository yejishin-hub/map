<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 생성하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1fdcf1508451b00789df5e78a982931"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
<style>
	body{overflow-y:hidden;}
	#header{
		position:relative;
		height:60px;
	}
	#sideBar{
		overflow-x: hidden;
		overflow-y:auto;
	    float: left;
	    position: relative;
	    z-index: 25;
	    width: 300px;
	    height: 900px;
	    background-color: #fcfcfc;
	}
	#map{
		z-index: 10;
		position:fixed;
		top:60px;
		left:0px;
		float:right;
		width: 100%; 
		height: 900px;
	}
	.searchbar{
		align:center;
		width: 90%;
	    height: 50px;
	    background-color: white;
	    border-radius: 5px;
	    padding: 10px;
	    margin-top:10px;
    }
    .search_input{
	    color: white;
	    border: 0;
	    outline: 0;
	    background: none;
	    width: 200px;
	    line-height: 25px;
    }
    .search_icon{
	    height: 30px;
	    width: 40px;
	    float: right;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color:#f0bc6e;
	    text-decoration:none;
	    border:0px;
	    background-color:white;
    }
    .search_icon:hover{
    	color:#ff9900;
    }
    .store_info{
		align:center;
	    height: 200px;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
    }
    .partylist{
    	align:center;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
    }
    .partylist .party{
    	padding:5px;
    	background-color:#ededed;
	    border-radius: 5px;
    	height:50px;
    	margin-top:1px;
    }
    nav{margin-top:3px;}
    .partylist .title{
    	float:left;
    	width:190px;
    }
    .partylist .join{
    	float:left;
    	background-color:#ff9900;
    }
    .reviewlist{
    	align:center;
	    height: 200px;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
    }
</style>
<script>
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	})
</script>
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
		<div id="header">헤더입니다.</div>
		<div id="sideBar">
			<div class="searchbar mx-auto">
	          <input type="text" class="search_input" name="keyword" placeholder="맛집 키워드 검색">
	          <button type="button" class="search_icon"><i class="fas fa-search"></i></button>
	        </div>
	        <div class="store_info mx-auto">
	        	맛집 정보 출력<br>
	        	가게명<br>
	        	가게주소<br>
	        	etc
	        </div>
	        <div class="partylist">
	        	<b>진행중인 모임</b>
	        	<div class="party">
	        		<div class="title">제목</div>
	        		<button type="button" class="btn btn-primary" class="join">참가</button>
	        	</div>
	        	<div class="party">
	        		<div class="title">제목</div>
	        		<button type="button" class="btn btn-primary" class="join">참가</button>
	        	</div>
	        	<div class="party">
	        		<div class="title">제목</div>
	        		<button type="button" class="btn btn-primary" class="join">참가</button>
	        	</div>
	        	<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
	        </div>
	        <div class="reviewlist">
	        	<b>리뷰</b>
	        </div>
		</div>
		<div id="map"></div>
</body>
</html>
