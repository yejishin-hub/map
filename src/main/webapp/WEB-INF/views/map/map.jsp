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
	    float: left;
	    position: relative;
	    z-index: 25;
	    width: 300px;
	    height: 860px;
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
	.search_area{background-color:#ff9900;height: 80px;padding-top:15px;padding-bottom:15px;}
	.searchbar{
		align:center;
		width: 90%;
	    height: 50px;
	    background-color: white;
	    border-radius: 5px;
	    padding: 10px;
    }
    .choose_info{overflow-x: hidden;overflow-y:auto;height:780px;}
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
	    color:#ffd900;
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
    }
    .partylist{
    	align:center;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
    }
    .partylist .party{
    	padding:5px;
    	background-color:white;
    	height:50px;
    	margin-top:0px;
	    position:relative;
	    font-size:10pt;
    }
    nav{margin-top:10px;}
    .page-item{margin-left:2px;margin-right:2px;}
    .page-link{
    	line-height:1 !important;
    	border-radius:20px !important;
    	border:0px;
    	color:#ff9900;
    }
    .page-item:hover .page-link{color:black;}
    .partylist .title{
    	float:left;
    	width:150px;
    }
    .partylist .join{
    	position:absolute;
    	right:5px;
    	background-color:#ff9900;
    	border:0px;
    	font-size:10pt;
    }
    .reviewlist{
    	align:center;
	    height: 200px;
	    border-top:1px solid #ededed;
	    padding: 20px;
    }
    .party:nth-child(2){margin-top:10px;}
    .review:nth-child(2){margin-top:10px;}
    .reviewlist .review{
    	background-color:white;
    	padding:10px;
    	font-size:8pt;	

    }
    .reviewlist .bottom{text-align:right;}
    .bg_bar {
    height: 11px;
    background-color: #e2e2e2;
    display: inline-block;
    width: 1px;
        margin: 6px 7px 0 8px;
	}
	.rating i{color:#ffd900;}
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
			<div class="search_area">
				<div class="searchbar mx-auto">
		          <input type="text" class="search_input" name="keyword" placeholder="맛집 키워드 검색">
		          <button type="button" class="search_icon"><i class="fas fa-search"></i></button>
		        </div>
			</div>
	        <div class="choose_info">
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
	        		<button type="button" class="btn btn-primary join">참가</button>
	        	</div>
	        	<div class="party">
	        		<div class="title">제목</div>
	        		<button type="button" class="btn btn-primary join">참가</button>
	        	</div>
	        	<div class="party">
	        		<div class="title">제목</div>
	        		<button type="button" class="btn btn-primary join">참가</button>
	        	</div>
	        	<nav aria-label="Page navigation example">
				  <ul class="pagination pagination-sm justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <i class="fas fa-chevron-left"></i>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">4</a></li>
				    <li class="page-item"><a class="page-link" href="#">5</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <i class="fas fa-chevron-right"></i>
				      </a>
				    </li>
				  </ul>
				</nav>
	        </div>
	        <div class="reviewlist">
		        	<b>리뷰</b>
		        	<div class="review">
		        		<i class="fas fa-user fa-2x"></i>
		        		<div class="rating">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star-half-alt"></i>
							<i class="far fa-star"></i>
						</div>
		        		<div class="content">맛있어요~</div>
		        		<div class="bottom">
		        			홍길동<span class="bg_bar"></span>
		        			10:56 AM<span class="bg_bar"></span>
		        			신고
		        		</div>
		        	</div>
		        	<div class="review">
		        		<i class="fas fa-user fa-2x"></i>
		        		<div class="rating">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star-half-alt"></i>
							<i class="far fa-star"></i>
						</div>
		        		<div class="content">맛있어요~</div>
		        		<div class="bottom">
		        			홍길동<span class="bg_bar"></span>
		        			10:56 AM<span class="bg_bar"></span>
		        			신고
		        		</div>
		        	</div>
		        	<div class="review">
		        		<i class="fas fa-user fa-2x"></i>
		        		<div class="rating">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star-half-alt"></i>
							<i class="far fa-star"></i>
						</div>
		        		<div class="content">맛있어요~</div>
		        		<div class="bottom">
		        			홍길동<span class="bg_bar"></span>
		        			10:56 AM<span class="bg_bar"></span>
		        			신고
		        		</div>
		        	</div>
		        	<div class="review_comment">
		        		<b>아무개님,</b>
		        		이미지 첨부 <button type=button><i class="fas fa-images"></i></button>
		        		<input type=text placeholder="리뷰 내용을 입력해주세요.">
		        		<input type=submit value="리뷰 작성하기">
		        	</div>
		        </div>
			</div>
		</div>
		<div id="map"></div>
		
</body>
</html>

