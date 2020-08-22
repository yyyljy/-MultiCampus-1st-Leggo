<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=1024" charset="UTF-8">

	<link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202002061407254/app_A.css">
	<link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202002061407254/app_B.css">
    <link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202002061407254/app_C.css">
    <link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202002061407254/app_D.css">
            <link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202002061407254/canvas_roadview.css">
    
<link rel="icon" type="image/x-icon" href="/favicon.ico">

<title>카카오맵</title>
<script type="text/javascript">
document.domain = location.host.indexOf('kakao.com') != -1 ? 'kakao.com' : 'daum.net';

if (true === true && (true === false || 0) && document.referrer.split('?')[0] === "https://accounts.kakao.com/login/kakaomap?continue=".split('?')[0]) {
	window.location.href = window.location.origin + '/user/signup';
}
</script>

<meta property="og:site_name" content="카카오맵">
<meta property="og:title" content="카카오맵">
<meta property="og:description" content="당신을 좋은 곳으로 안내 할 지도">
<meta property="og:type" content="websit">
<meta property="og:image" content="//t1.daumcdn.net/localimg/localimages/07/common/ogtag.png">
	
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="카카오맵">
<meta name="twitter:description" content="당신을 좋은 곳으로 안내 할 지도">
<meta name="twitter:image" content="//t1.daumcdn.net/localimg/localimages/07/common/ogtag.png">

<meta name="description" content="당신을 좋은 곳으로 안내 할 지도"><link rel="search" type="application/opensearchdescription+xml" href="/OpenSearch.xml" title="카카오맵">
<style>/* reset */
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,button{margin:0;padding:0}
fieldset,img{border:0 none}
dl,ul,ol,menu,li{list-style:none}
blockquote, q{quotes: none}
blockquote:before, blockquote:after,q:before, q:after{content:'';content:none}
input,select,textarea,button{vertical-align:middle}
input::-ms-clear{display:none}
button{border:0 none;background-color:transparent;cursor:pointer}
body{background:#fff}
body,th,td,input,select,textarea,button{font-size:12px;line-height:1.5;font-family:AppleSDGothicNeo-Regular,'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif;color:#222}
a{color:#333;text-decoration:none}
a:active, a:hover{text-decoration:underline}
a:active{background-color:transparent}
address,caption,cite,code,dfn,em,var{font-style:normal;font-weight:normal}

/* global */
.screen_out{overflow:hidden;position:absolute;width:0;height:0;line-height:0;text-indent:-9999px}
.show{display:block}
.hide{display:none}

/* PC Social Share */
/* 2018-04-25 수정 시작 */
.social_comm_p{position:absolute;z-index:1000;}
.social_comm_p .img_social{display:block;overflow:hidden;font-size:0;background:url(//t1.daumcdn.net/daumtop_deco/images/common/social/img_social_180425.png) no-repeat 0 0;text-indent:-9999px}
.social_comm_p .sns_comm_p{overflow:hidden;position:relative;border:1px solid #e2e2e2;font-size:12px;color:#222;background-color:#fff;letter-spacing:-0.025em}
.social_comm_p .sns_comm_p .btn_close{position:absolute;top:7px;right:7px;width:24px;height:24px}
.social_comm_p .sns_comm_p .ico_close{width:14px;height:14px;margin:5px;background-position:-150px 0}
.social_comm_p .share_layer{position:relative;width:289px;min-height:253px}
.social_comm_p .list_sns{overflow:hidden;margin:29px 15px 0}
.social_comm_p .list_sns li{float:left;width:86px;height:86px}
.social_comm_p .list_sns .link_sns{display:block;text-align:center;text-decoration:none}
.social_comm_p .list_sns .link_sns .img_social{width:48px;height:48px;margin:0 auto}
.social_comm_p .list_sns .tit_sns{display:block;margin-top:7px;font-weight:normal;line-height:16px}
.social_comm_p .list_sns .ico_sns_ks{background-position:0 0}
.social_comm_p .list_sns .ico_sns_fb{background-position:-50px 0}
.social_comm_p .list_sns .ico_sns_tw{background-position:-100px 0}
.social_comm_p .list_sns .ico_sns_cafe{background-position:0 -50px}
.social_comm_p .list_sns .ico_sns_mail{background-position:-50px -50px}
.social_comm_p .list_sns .ico_sns_kt{background-position:0 -100px}
.social_comm_p .sns_copyurl{margin:1px 29px}
.social_comm_p .sns_copyurl .link_copyurl{display:block;overflow:hidden;position:relative;height:25px;line-height:25px;border:1px solid #d0d0d0;background-color:#f8f8f8;text-decoration:none}
.social_comm_p .sns_copyurl .txt_url{display:block;overflow:hidden;padding:0 60px 0 10px;color:#2695f8;white-space:nowrap;text-overflow:ellipsis}
.social_comm_p .sns_copyurl .txt_copy{position:absolute;top:0;right:0;width:53px;height:25px;border-left:1px solid #d0d0d0;background-color:#fff;text-align:center}
.social_comm_p .copyurl_layer{width:254px;height:78px;text-align:center}
.social_comm_p .inner_copyurl{display:table;width:100%;height:100%}
.social_comm_p .inner_copyurl .desc_copyurl{display:table-cell;padding:18px 0 17px;line-height:19px;vertical-align:middle}
.social_comm_p .sns_copyurl_type2 .tf_url{display:block;width:210px;height:25px;padding:0 10px;border:0 none;color:#2695f8;background-color:transparent}
.social_comm_p .sns_copyurl_type2 .desc_tip{padding:13px 0;line-height:18px;color:#888;text-align:center;letter-spacing:0}

@media
only screen and (-webkit-min-device-pixel-ratio: 1.5),
only screen and (min-device-pixel-ratio: 1.5),
only screen and (min-resolution: 144dpi),
only screen and (min-resolution: 1.5dppx) {
    .social_comm_p .img_social{background-image:url(//t1.daumcdn.net/daumtop_deco/images/common/social/rtn/img_social_180425.png);background-size:170px 160px}
}</style><style></style>

	<style type="text/css">
	
	input::-webkit-input-placeholder {
		color: red;
		font-style: italic;
	}

	input::-ms-input-placeholder {
		color: red;
		font-style: italic;
	}
	
</style>



</head>

<body>
<!-- class="w3-cell" class="col-9" id="freesidebar" style="width: 60%;" id="freemenubtn"-->
	<!-- Sidebar/menu -->
	<div id="freesidebar">
		<div id="freemenubtn">
			<form action="" method="get">
				<input type="text" maxlength="10" style="color:white;" placeholder="검색하세요" /><br/>
				
				<input type="reset" value="다시입력" style="background-color: #ffffff; font-size: 14pt;" />
				<input type="submit" value="검색" style="background-color: #ffffff; font-size: 14pt;" />
			
			</form>
	
			
			
	<!-- 		<h2 class="w3-gray" style="text-shadow:1px 1px 0 #444;font-size:20px">서울시 강남구 역삼동</h2>
			<a href="" onclick="" class="w3-button">길찾기</a> 
			<a href="" onclick="" class="w3-button">★</a> 
			<a href="/leggo/parking.do"" onclick="" class="w3-button">P</a>
			<a href="/leggo/lastmile.do" onclick="" class="w3-button">Last</a>	 -->	
		</div>
	</div>
	
	
	//검색어 창 부분
<div id="info.route.searchBox" class="RouteSearchBox WHITEOUT">
        <div id="info.route.searchBox.list"><div class="WaypointBoxView origin" sortid="0" style="left: 0px; top: 0px; position: relative;"><div class="dragArea"><span class="title origin"></span></div><div class="waypointWindow" style="position: relative;"><input class="valueBox" readonly="" placeholder="출발지를 입력하세요"><form class="WaypointInput"><input id="info.route.waypointSuggest.input0" title="검색어 입력" class="input" type="text" autocomplete="off"><input class="submit" type="submit" value=""><blockquote id="info.route.waypointSuggest.input0Suggest" class="inputSuggest"><div class="suggestBox box_sub" style="display: none;"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"></div><div class="search_recent">
    <em class="tit_recent">히스토리</em>
    <ul data-id="wrap" class="list_recent"><li class="ms_item">
    <a href="#" data-id="link" id="" class="link_search">
        <span class="ico_search_history ico_history_place"></span>멀티캠퍼스 역삼
    </a>
    <button data-id="remove" class="btn_delete" aria-describedby="" data-type="place" data-idx="0">
        <span class="ico_search_history ico_delete">삭제</span>
    </button>
</li><li class="ms_item">
    <a href="#" data-id="link" id="" class="link_search">
        <span class="ico_search_history ico_history_place"></span>엑스오멀티짐
    </a>
    <button data-id="remove" class="btn_delete" aria-describedby="" data-type="place" data-idx="1">
        <span class="ico_search_history ico_delete">삭제</span>
    </button>
</li></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall">전체삭제</button>
    </div>
</div></div></blockquote></form></div></div><div class="WaypointBoxView dest" sortid="1" style="left: 0px; top: 0px; position: relative;"><div class="dragArea"><span class="title dest"></span></div><div class="waypointWindow"><input class="valueBox" readonly="" placeholder="도착지를 입력하세요"><form class="WaypointInput HIDDEN"><input id="info.route.waypointSuggest.input1" title="검색어 입력" class="input" type="text" autocomplete="off"><input class="submit" type="submit" value=""><blockquote id="info.route.waypointSuggest.input1Suggest" class="inputSuggest"><div class="suggestBox box_sub"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"></div><div class="search_recent">
    <em class="tit_recent">히스토리</em>
    <ul data-id="wrap" class="list_recent"><li class="ms_item">
    <a href="#" data-id="link" id="" class="link_search">
        <span class="ico_search_history ico_history_place"></span>멀티캠퍼스 역삼
    </a>
    <button data-id="remove" class="btn_delete" aria-describedby="" data-type="place" data-idx="0">
        <span class="ico_search_history ico_delete">삭제</span>
    </button>
</li><li class="ms_item">
    <a href="#" data-id="link" id="" class="link_search">
        <span class="ico_search_history ico_history_place"></span>엑스오멀티짐
    </a>
    <button data-id="remove" class="btn_delete" aria-describedby="" data-type="place" data-idx="1">
        <span class="ico_search_history ico_delete">삭제</span>
    </button>
</li></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall">전체삭제</button>
    </div>
</div></div></blockquote></form></div></div></div>
        <a href="#none" id="info.route.searchBox.toggleVia" class="btn_roadsearch toggleVia">경유지 추가</a>
        <!-- 2018-08-01 마크업 위치 변경 및 대체 텍스트 추가, btn_roadsearch 추가 -->
        <a href="#none" id="info.route.searchBox.change" class="btn_roadsearch routechange" title="출발/도착 순서 바꾸기">출발/도착 순서 바꾸기</a>
        <!-- 2018-07-01 모두 지우기 버튼 마크업 위치 변경, .btn_roadsearch 추가 -->
        <a href="#none" id="info.route.searchBox.clearVia" class="btn_roadsearch clearVia" title="모두 지우기">모두 지우기</a>
        <!--
            <blockquote id="search.reverseHint" class="HIDDEN reverseHint"></blockquote>
        -->
    </div>
	
	//교통편 선택
	<div id="info.flagsearch.method" class="routeMethod">
		<div class="RouteMethodTabView">
		<a id="cartab" data-id="car" class="car car-active" href="#"></a>
		<a id="transittab" data-id="transit" class="transit" href="#"></a>
		<a id="walktab" data-id="walk" class="walk" href="#"></a>
		<a id="biketab" data-id="bike" class="bike" href="#"></a>
	</div>
	</div>	
	
	//최근 길찾기 검색 결과
<div id="info.route.home" class="routeHistory"><div class="cont_latest">
    <h6 class="tit_favorite tit_recently">최근 길찾기 검색</h6>
    <ul data-id="wrap" class="list_registerated">
        <li data-type="route_car" data-idx="0">
            <div class="favorite_registerated">
                <a href="#" id="route_car0" class="link_registerated">
                    <strong class="ico_pin2 ico_carroute">자동차 길찾기</strong>
                    <div class="registerated_route">
                        <span class="wrap_route">
                            <span class="ico_interlock2 ico_depart">출발</span>
                            <span class="txt_route txt_depart">서울 강남구 역삼동 827-8</span>
                        </span>
                        <span class="wrap_route">
                            <span class="ico_interlock2 ico_arrive"><span class="arrive_g">도착</span></span>
                            <span class="txt_route txt_arrive">서울 강남구 역삼동 828-33</span>
                        </span>
                    </div>
                </a>
                <button class="btn_delete" aria-describedby="route_car0" data-type="route_car" data-idx="0">
                    <span class="ico_interlock2 ico_delete">삭제</span>
                </button>
            </div>
        </li>
        <li data-type="route_car" data-idx="1">
            <div class="favorite_registerated">
                <a href="#" id="route_car1" class="link_registerated">
                    <strong class="ico_pin2 ico_carroute">자동차 길찾기</strong>
                    <div class="registerated_route">
                        <span class="wrap_route">
                            <span class="ico_interlock2 ico_depart">출발</span>
                            <span class="txt_route txt_depart">서울 강남구 역삼동 858-16</span>
                        </span>
                        <span class="wrap_route">
                            <span class="ico_interlock2 ico_arrive"><span class="arrive_g">도착</span></span>
                            <span class="txt_route txt_arrive">서울 강남구 역삼동 828-33</span>
                        </span>
                    </div>
                </a>
                <button class="btn_delete" aria-describedby="route_car1" data-type="route_car" data-idx="1">
                    <span class="ico_interlock2 ico_delete">삭제</span>
                </button>
            </div>
        </li>
        <li data-type="route_car" data-idx="2">
            <div class="favorite_registerated">
                <a href="#" id="route_car2" class="link_registerated">
                    <strong class="ico_pin2 ico_carroute">자동차 길찾기</strong>
                    <div class="registerated_route">
                        <span class="wrap_route">
                            <span class="ico_interlock2 ico_depart">출발</span>
                            <span class="txt_route txt_depart">멀티캠퍼스 역삼</span>
                        </span>
                        <span class="wrap_route">
                            <span class="ico_interlock2 ico_arrive"><span class="arrive_g">도착</span></span>
                            <span class="txt_route txt_arrive">대전역</span>
                        </span>
                    </div>
                </a>
                <button class="btn_delete" aria-describedby="route_car2" data-type="route_car" data-idx="2">
                    <span class="ico_interlock2 ico_delete">삭제</span>
                </button>
            </div>
        </li>
    </ul>
</div></div>
	
	
	
</body>
</html>