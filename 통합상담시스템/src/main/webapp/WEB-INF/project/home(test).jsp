<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>통합 상담 시스템</title>
<meta name="keywords" content="통합 상담 시스템">
<meta name="description" content="통합 상담 시스템 홈페이지에 오신 것을 환영합니다. ">
<meta name="robots" content="index,follow">
<meta property="og:title" content="통합 상담 시스템">
<meta property="og:description" content="통합 상담 시스템 홈페이지에 오신 것을 환영합니다.">
<meta property="og:type" content="website">
<meta property="og:url" content="Project/home.do">
<meta property="og:site_name" content="통합 상담 시스템">

<link rel="stylesheet" href="./css/web/gneti/common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/con_common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/layout.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/main.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/main_widget.css"
	media="all">
<link rel="stylesheet" href="./css/com/jquery/jquery-ui.min.css"
	media="all">

<script type="text/javascript" src="./js/gne/html5shiv.js"></script>
<script type="text/javascript" src="./js/gne/jquery.min.js"></script>
<script type="text/javascript" src="./js/gne/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="./js/gne/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/gne/jquery.form.min.js"></script>
<script type="text/javascript" src="./js/web/gneti/common.js?v=20221217"></script>
<script type="text/javascript" src="./js/web/gneti/slick.min.js"></script>
<script type="text/javascript" src="./js/web/gneti/main.js"></script>
<script type="text/javascript" src="./js/web/gneti/topmenu.js"></script>
<!--메뉴동작-->
<script type="text/javascript" src="./js/gne/script.js"></script>
<!--자주사용 스크립트-->
<script type="text/javascript" src="./js/gne/common-scroll.js"></script>
<!--스크롤롤링-->
<script type="text/javascript" src="./js/gne/modernizr-2.6.2.min.js"></script>
<!--익스8이하지원-->
<script type="text/javascript" src="./js/gne/noOpenerReferrer.js"></script>
</head>
<body>

	<div id="wrap">


		<!-- header -->
		<header id="header">
			<div id="snb">
				<h1>
					<a href="./home.do"> <img
						src="./images/web/gneti/common/logo.png" alt="통합 상담 시스템"></a>
				</h1>
				<!--//230614-->
			</div>

			<!-- pc -->
			<nav id="gnb">
				<div id="gnbwrap">
					<h2 class="blind">주 메뉴</h2>
					<div id="animate" class="nobg">
						<div id="tnb">
							<!-- PC 메뉴 생성 -->
							<!--START-->
							<%
								Object ID1 = session.getAttribute("teacher");
							Object ID2 = session.getAttribute("s_parents");
							System.out.println("getAttribute-교사 :" + ID1);
							System.out.println("getAttribute-학부모 :" + ID2);
							%>
							<table>
								<tr>

									<%
										if (ID1 == null && ID2 == null) {
									%>

									<ul id="tm">
										<li class="th1"><a class="th1_lnk" href="home.do">홈페이지</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectNoticeList.do">공지사항</a></li>
										<li class="th1"><a class="th1_lnk" href="join.do">회원가입</a></li>
										<li class="th1"><a class="th1_lnk" href="loginForm.do">로그인</a></li>
									</ul>
									<%
										} else if (ID1 != null) {
									%>
									<ul id="tm">
										<li class="th1"><a class="th1_lnk" href="home.do">홈페이지</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectNoticeList.do">공지사항</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectInquiryList.do">문의사항</a></li>
										<li class="th1"><a class="th1_lnk" href="mypage.do">관리자페이지</a>
										</th>
										<li class="th1"><a class="th1_lnk"
											href="selectRsvtList.do">예약현황</a>
										</th>
										<li class="th1"><a class="th1_lnk" href="logout.do">로그아웃</a>
										</th>
									</ul>
									<%
										} else {
									%>
									<ul id="tm">
										<li class="th1"><a class="th1_lnk" href="home.do">홈페이지</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectNoticeList.do">공지사항</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectInquiryList.do">문의사항</a></li>
										<li class="th1"><a class="th1_lnk" href="mypage.do">마이페이지</a>
										</th>
										<li class="th1"><a class="th1_lnk" href="insertRsvt.do">예약하기</a>
										</th>
										<li class="th1"><a class="th1_lnk" href="logout.do">로그아웃</a>
										</th>
									</ul>
									<%
										}
									%>
								</tr>
							</table>


							<!--END-->
							<!-- PC 메뉴 생성 -->
						</div>
					</div>
				</div>
			</nav>
			<script type="text/javascript">
                  var param = "#gnbwrap";
                  var obj = ".th2";
                  var btn = ".th1>a";
                  var wrap = "#animate";
                  var elem = 01; // th1 메뉴코드, index로 사용
                  var scale = 1000; // 입력한 해상도 이하애서 실행 안함
                  var dur = 1000; // 애니메이션 진행 속도
                  var meth = "easeOutExpo"; // 애니메이션 진행 타입
                  var mno = "";
                  gnb(param,obj,btn,wrap,elem,scale,dur,meth,mno);
              </script>
		</header>

		<!-- shadow-->
		<div id="gnbShadow"></div>

		<!-- //header  -->

		<!-- container -->
		<div id="container">
			<a href="#none" name="container" title="메인콘텐츠 바로가기" class="hid"
				tabindex="-1">메인콘텐츠 바로가기</a>




			<script>

	$(document).ready(function(){

		
		
	});
	
</script>








			<a href="#none" name="container" title="메인콘텐츠 바로가기" class="hid">메인콘텐츠
				바로가기</a>

			<div id="container">
				<div class="main_content">

					<div class="MC_wrap1">
						<div class="container">
							<div class="MC_box1">
								<!-- 비주얼 -->
								<div class="main_visual">
									<div id="m_visual">
										<!-- <div class="item"><img src="/images/web/gneti/main/m_visual1.png" alt="미래를 이끌어갈 민주시민을 육성하는 행복한 산청교육"></div>
								<div class="item"><img src="/images/web/gneti/main/m_visual2.png" alt="미래를 이끌어갈 민주시민을 육성하는 행복한 산청교육"></div> -->
										<div class="item">
											<img src="./images/web/gneti/main/m_visual3.png"
												alt="미래를 이끌어갈 인재양성 3종비니다">
										</div>
									</div>
									<!--슬라이드 control -->
								</div>
								<!-- //비주얼 -->
							</div>
						</div>
					</div>

					<div class="container">
						<div class="MC_box2">
							<!-- 바로가기 230614 -->
							<div class="M_link">
								<div class="slider" id="linkSlider1">

									<div class="item">
										<a href="https://www.neis.go.kr/nxuiPortal/index.html"><p>
												<img src="./images/web/gneti/main/ico_link01_3.png"
													alt="넣을지">
											</p> <span>나이스 대국민서비스</span></a>
									</div>

									<div class="item">
										<a href="http://www.parents.go.kr/index.do"><p>
												<img src="./images/web/gneti/main/ico_link01_1.png"
													alt="이곳에">
											</p> <span>학부모On누리</span></a>
									</div>
									<div class="item">
										<a href="https://www.career.go.kr/jr/"><p>
												<img src="./images/web/gneti/main/ico_link01_2.png"
													alt="무엇을">
											</p> <span>주니어커리어넷</span></a>
									</div>
									<div class="item">
										<a href="https://www.dip.or.kr/home/main.ubs"><p>
												<img src="./images/web/gneti/main/ico_link01_4.png"
													alt="dip 오시는길">
											</p> <span>대구디지털혁신진흥원</span></a>
									</div>
									<div class="item">
										<a href="https://www.moe.go.kr/main.do"><p>
												<img src="./images/web/gneti/main/ico_link01_5.png"
													alt="상담시설안내">
											</p> <span>교육부 홈페이지</span></a>
									</div>
									<div class="item">
										<a href="https://www.stopbullying.re.kr/mps"><p>
												<img src="./images/web/gneti/main/ico_link01_6.png"
													alt="학폭예지센">
											</p> <span>학교폭력 예방교육지원센터</span></a>
									</div>
								</div>
							</div>
							<!-- //바로가기 -->
						</div>

						<div class="MC_box3">
							<a class="M_link2" href="http://gneti.or.kr" target="_blank"
								title="새창으로 열림">통합상담시스템<span>더보기</span>
							</a>
						</div>
					</div>

					<div class="container">
						<div class="MC_box4">

							<script>	
						$(document).ready(function(){
							setCalenDar('curM');	
						});
						
						function setCalenDar(actM){		
							var date = new Date(); 
							var y = $(".schedule #year").attr("data-in");
							var m = $(".schedule #month").attr("data-in");
							var d = date.getDate(); 
							
							if ( actM == 'preM' ){
								m--;
								
								if ( m < 1 ){
									y--;
									m = 12;
								}
								m += '';
								
								$(".schedule #year").attr("data-in",y).text(y);
								$(".schedule #month").attr("data-in",m).text(m);
								$(".schedule .calTbody tr td").remove();
								
							} else if( actM == 'nextM' ){ 
								m++;
								
								if ( m > 12 ){
									y++;
									m = 1;
								}
								m += '';
								
								$(".schedule #year").attr("data-in",y).text(y);
								$(".schedule #month").attr("data-in",m).text(m);
								$(".schedule .calTbody tr td").remove();
								
							} else {
								y = date.getFullYear();
								m = date.getMonth()+1;
								m += '';
								$(".schedule #year").attr("data-in",y).text(y);
								$(".schedule #month").attr("data-in",m).text(m);
								$(".schedule .calTbody tr td").remove();
							}
								
							var theDate = new Date(y,m-1,1);
							var theDay = theDate.getDay();
							var last = [0,31,28,31,30,31,30,31,31,30,31,30,31];
							var lastDate = last[m];
							var row = Math.ceil((theDay+lastDate)/7);
							var calendar = "";
							var dNum = 1;
							 
							if ( m.length < 2 ){
								 m = "0"+m;		
							 }
							
							for (var i = 1; i <= row; i++) {
								calendar += "<tr>";
								for (var k= 1; k <= 7; k++) {		    	 
									var idDate = 1;
									var dayforweek ="";
									if(k == 1) dayforweek = "sun";
									if(k == 7) dayforweek = "sat";
									if(i == 1 && k <= theDay || dNum > lastDate) {
										if(k == 1 || k == 7)
											calendar += "<td><span class=\""+dayforweek+"\"> &nbsp; </span></td>";
										else	
											calendar += "<td><span> &nbsp; </span></td>";
									} else { 
										
										if ( dNum < 10){
											idDate = "0" + dNum; 
										} else {
											idDate = dNum;
										} 
										var schdulDate = ""+y + ""+m + idDate;
										if(k == 1 || k == 7 )
											calendar += "<td id = 'dateTd"+schdulDate+"' data-id='"+schdulDate+"' ><span class=\""+dayforweek+"\" id ='aChkDate"+schdulDate+"' class=''>" + dNum + "</span></td>";	            
										else
											calendar += "<td id = 'dateTd"+schdulDate+"' data-id='"+schdulDate+"' ><span id ='aChkDate"+schdulDate+"' class=''>" + dNum + "</span></td>";
										dNum++;
									}
								}
								calendar += "</tr>";
							}
							$(".schedule .calTbody").append(calendar);
							selectScheduleInfo(actM,y,m,d);
						}

						
						//일정 데이터 위젯에 호출
						function selectScheduleInfo(paraAct,paraY,paraM,paraD){
							var sysId    = "gneti";
							var srchDate  = "";
							if ( paraAct == "curM"){
								 var month = "9";
								 
								 if ( month.length < 2){
									  month = "0"+month;		    	
									}
									  srchDate = "2023" +"/"+month;
								 
							} else {
								srchDate = paraY +"/"+paraM;
							}
							
							$.ajax({
									type : "POST",
								datatype : "json",
									data : {
											srchDate : srchDate,
											   sysId : sysId 
									},
									 url : "/gneti/sv/schdulView/selectSvList.do",
								 success : function(data){
								   
									var schList = JSON.parse(data);
									var viewScList  = "";
									var bgndeArr    = "";
									var enddeArr    = "";
									var bgnde       = "";
									var endde       = "";
									
									for ( var i = 0 ; i < schList.length ; i++){
										   
										   if ( schList[i].bgnde != ""){
											 bgndeArr += schList[i].bgnde+",";
											 enddeArr += schList[i].endde+",";
										   }
										   
										   if ( schList[i].bgnde.indexOf(srchDate) >= 0){
											   bgnde = schList[i].bgnde.substring(2,4) + "." + schList[i].bgnde.substring(5,7) + "." + schList[i].bgnde.substring(8,10);
											   endde = schList[i].endde.substring(2,4) + "." + schList[i].endde.substring(5,7) + "." + schList[i].endde.substring(8,10);
											   viewScList += "<li><a href='#'><span>" + bgnde + "~" + endde + "</span><em>" + schList[i].schdulTitle + "</em></a></li>";
											}
									}
									
									if (viewScList == "") {
										viewScList += "<li class='no_data'>데이터가 없습니다.</li>";
									}
									
									$(".lst li").remove();
									$(".lst ul").append(viewScList);
									
									var bgndeArrObj = bgndeArr.split(",");
									var enddeArrObj = enddeArr.split(",");
									
									for ( var j = 0 ; j < bgndeArrObj.length ; j ++){
											
										  var bgndeObj = bgndeArrObj[j].substring(0,4) + bgndeArrObj[j].substring(5,7) + bgndeArrObj[j].substring(8,10);
										  var enddeObj = enddeArrObj[j].substring(0,4) + enddeArrObj[j].substring(5,7) + enddeArrObj[j].substring(8,10);
										  
										  //달력에 일정 표시
										  for ( var sc = parseInt(bgndeObj) ; sc <= parseInt(enddeObj) ; sc++ ){
											  	$("#aChkDate"+sc).replaceWith("<a id='aChkDate" + sc + "'>" + $("#aChkDate"+sc).text() + "</a>");
												$("#aChkDate"+sc).attr("class","event");
												$("#aChkDate"+sc).attr("href","javascript:");
												$("#aChkDate"+sc).attr("onClick","javascript:openScheduleDialog('"+srchDate+"',this)");
										  }
									}
									var date = new Date();
									var todayY = ""+date.getFullYear();
									var todayM = ""+(date.getMonth() + 1);
									var todayD = ""+date.getDate();										  										   
									$("#aChkDate"+todayY+""+todayM+""+todayD).attr("class","today");				   	
								},
								  error : function(data){
									console.log("관리자에게 문의해주세요.");	
								}
							});
						}
						
						
						//일정 상세 조회
						function openScheduleDialog(paraDate,el){
							var paraDay = $(el).text();
							
							if ( paraDay.length == 1 ){
								 paraDay = "0"+paraDay;
							}
							
							var openDateObj = paraDate + "/" + paraDay;
							var sysId      = "gneti";
							
							$.ajax({
								
									type : "POST",
								datatype :"json",
									data : {
											 paraDate : openDateObj
											   ,sysId : sysId
								},
									 url : "/gneti/sv/schdulView/selectWidgSvList.do",
								 success : function(result){
									var addList = JSON.parse(result);
									var addHtml = "";
									for( idx=0 ; idx < addList.length; idx++){
										//공휴일 데이터 설정
										var addinfo = addList[idx];
										if(addinfo.schdulSeq == 'holiday'){
											if( addinfo.bgnde == openDateObj ){
												
												 addHtml +="<tr>\n";
												 addHtml +="\t<th scope=\"row\">공휴일</th>\n";
												 addHtml +="\t<td class=\"ac\">"+addinfo.schdulTitle+"</td>\n";
												 
												 var timeObj = "하루종일";
												 
												 addHtml +="\t<td class=\"ac\">"+addinfo.bgnde+"</td>\n";
												 addHtml +="\t<td class=\"ac\">"+addinfo.endde+"</td>\n";
												 addHtml +="\t<td class=\"ac\">"+timeObj+"</td>\n";
												 addHtml +="</tr>\n";
												
											}
											
										} else {
											
											 //일반 일정 데이터 설정
											 addHtml +="<tr>\n";
											 addHtml +="\t<th scope=\"row\">"+addinfo.schdulSeq+"</th>\n";
											 addHtml +="\t<td class=\"ac\">"+addinfo.schdulTitle+"</td>\n";
											
											 var timeObj = addinfo.bgndeTime+" ~ "+addinfo.enddeTime;
											
											 if ( addinfo.bgndeTime == '00:00:00' && addinfo.enddeTime == '00:00:00'){
												  timeObj = "하루종일";
											 }
											
											 addHtml +="\t<td class=\"ac\">"+addinfo.bgnde+"</td>\n";
											 addHtml +="\t<td class=\"ac\">"+addinfo.endde+"</td>\n";
											 addHtml +="\t<td class=\"ac\">"+timeObj+"</td>\n";
											 addHtml +="</tr>\n";
										}
										 
									}
									
									$('#schedulPopLayerBody').html(addHtml);
									$("#schedulPopLayer").dialog({
										
										   autoOpen : false,
											  modal : false,
										 resizeable : false,
											  title : openDateObj + "일정 리스트",
											  width : 550,
											 height : 400,
											   show : {
											 effect : "blind",
										   duration : 100
													},
											   hide : {
											 effect : "blind",
										   duration : 100
													}
													
									}).dialog('open');
									
								},
								error : function(result){   
									alert("오류가 발생하였습니다.\n관리자에게 문의하세요.");
								}					
							});
						}
					</script>

							<!-- 캘린더 -->
							<div class="schedule">
								<h2>월간예약계획</h2>
								<div class="sche_wrap">
									<div class="sche_table">
										<p class="month">
											<span class="date"> <span id="year" data-in="2023">2023</span>
												<em> <span id="month" data-in="9">9</span>
											</em>
											</span> <a href="javascript:" class="prev" title="이전달"
												onclick="javascript:setCalenDar('preM')"> < <span
												class="hid">이전달</span><i class="xi-angle-left"
												aria-hidden="true"></i></a> <a href="javascript:" class="next"
												title="다음달" onclick="javascript:setCalenDar('nextM')"> >
												<span class="hid">다음달</span><i class="xi-angle-right"
												aria-hidden="true"></i>
											</a>
										</p>

										<table>
											<caption>원간교육계획</caption>
											<colgroup>
												<col style="width: 14.285%" span="8">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="sun">Sun</th>
													<th scope="col">Mon</th>
													<th scope="col">Tue</th>
													<th scope="col">Wed</th>
													<th scope="col">Thu</th>
													<th scope="col">Fri</th>
													<th scope="col" class="sat">Sat</th>
												</tr>
											</thead>
											<tbody class="calTbody">
												<tr>
													<td><span class="sun"> &nbsp; </span></td>
													<td><span> &nbsp; </span></td>
													<td><span> &nbsp; </span></td>
													<td><span> &nbsp; </span></td>
													<td><span> &nbsp; </span></td>
													<td id="dateTd20230901" data-id="20230901"><span
														id="aChkDate20230901" class="">1</span></td>
													<td id="dateTd20230902" data-id="20230902"><span
														class="sat" id="aChkDate20230902">2</span></td>
												</tr>
												<tr>
													<td id="dateTd20230903" data-id="20230903"><span
														class="sun" id="aChkDate20230903">3</span></td>
													<td id="dateTd20230904" data-id="20230904"><span
														id="aChkDate20230904" class="">4</span></td>
													<td id="dateTd20230905" data-id="20230905"><span
														id="aChkDate20230905" class="">5</span></td>
													<td id="dateTd20230906" data-id="20230906"><span
														id="aChkDate20230906" class="">6</span></td>
													<td id="dateTd20230907" data-id="20230907"><span
														id="aChkDate20230907" class="">7</span></td>
													<td id="dateTd20230908" data-id="20230908"><span
														id="aChkDate20230908" class="">8</span></td>
													<td id="dateTd20230909" data-id="20230909"><span
														class="sat" id="aChkDate20230909">9</span></td>
												</tr>
												<tr>
													<td id="dateTd20230910" data-id="20230910"><span
														class="sun" id="aChkDate20230910">10</span></td>
													<td id="dateTd20230911" data-id="20230911"><span
														id="aChkDate20230911" class="">11</span></td>
													<td id="dateTd20230912" data-id="20230912"><span
														id="aChkDate20230912" class="">12</span></td>
													<td id="dateTd20230913" data-id="20230913"><span
														id="aChkDate20230913" class="">13</span></td>
													<td id="dateTd20230914" data-id="20230914"><span
														id="aChkDate20230914" class="">14</span></td>
													<td id="dateTd20230915" data-id="20230915"><span
														id="aChkDate20230915" class="">15</span></td>
													<td id="dateTd20230916" data-id="20230916"><span
														class="sat" id="aChkDate20230916">16</span></td>
												</tr>
												<tr>
													<td id="dateTd20230917" data-id="20230917"><span
														class="sun" id="aChkDate20230917">17</span></td>
													<td id="dateTd20230918" data-id="20230918"><span
														id="aChkDate20230918" class="">18</span></td>
													<td id="dateTd20230919" data-id="20230919"><span
														id="aChkDate20230919" class="">19</span></td>
													<td id="dateTd20230920" data-id="20230920"><span
														id="aChkDate20230920" class="">20</span></td>
													<td id="dateTd20230921" data-id="20230921"><span
														id="aChkDate20230921" class="">21</span></td>
													<td id="dateTd20230922" data-id="20230922"><span
														id="aChkDate20230922" class="">22</span></td>
													<td id="dateTd20230923" data-id="20230923"><span
														class="sat" id="aChkDate20230923">23</span></td>
												</tr>
												<tr>
													<td id="dateTd20230924" data-id="20230924"><span
														class="sun" id="aChkDate20230924">24</span></td>
													<td id="dateTd20230925" data-id="20230925"><span
														id="aChkDate20230925" class="">25</span></td>
													<td id="dateTd20230926" data-id="20230926"><span
														id="aChkDate20230926" class="">26</span></td>
													<td id="dateTd20230927" data-id="20230927"><span
														id="aChkDate20230927" class="">27</span></td>
													<td id="dateTd20230928" data-id="20230928"><a
														id="aChkDate20230928" class="event" href="javascript:"
														onclick="javascript:openScheduleDialog('2023/09',this)">28</a></td>
													<td id="dateTd20230929" data-id="20230929"><a
														id="aChkDate20230929" class="event" href="javascript:"
														onclick="javascript:openScheduleDialog('2023/09',this)">29</a></td>
													<td id="dateTd20230930" data-id="20230930"><a
														id="aChkDate20230930" class="event" href="javascript:"
														onclick="javascript:openScheduleDialog('2023/09',this)">30</a></td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="lst">
										<ul>
											<li><a href="#"><span>23.09.08~23.09.08</span><em>준영아빠</em></a></li>
											<li><a href="#"><span>23.09.28~23.09.28</span><em>추석연휴</em></a></li>
											<li><a href="#"><span>23.09.29~23.09.29</span><em>추석</em></a></li>
											<li><a href="#"><span>23.09.30~23.09.30</span><em>추석연휴</em></a></li>
										</ul>
									</div>
								</div>

								<a href="/projectFinalFirst/schdul.jsp" class="btn_more"
									title="월간예약계획 더보기"> + <span class="hid">더보기</span><i
									class="xi-plus" aria-hidden="true"></i></a>
							</div>
							<!-- //캘린더 -->
						</div>
						<div class="MC_box5">
							<!-- 공지사항 -->
							<div class="notice">
								<h2 class="tit_1">
									<a href="">공지사항</a>
								</h2>
								<div class="list_box">



									<a href="/projectFinalFirst/selectNotice.do?ntc_no=4&rn=2"
										class="topList">
										<dl class="">
											<!-- 새글 dl 'new' class 추가-->
											<dt>현 시간부로 강수량이 줄어들었습니다.</dt>
											<dd>
												<p>차질 없이 학생들과 선생님들은 등교해주시기 바랍니다.&nbsp;&nbsp;&nbsp;</p>
												<span class="date">2023<em>09.02</em></span>
											</dd>
										</dl>
									</a>
									<ul>

										<li><a
											href="/projectFinalFirst/selectNotice.do?ntc_no=1&rn=1">
												<!-- 새글 a 'new' class 추가-->
												<p>첫 번 째, 공지사항입니다.</p> <span>2023-09-07</span>
										</a></li>

										<li><a
											href="/projectFinalFirst/selectNotice.do?ntc_no=2&rn=2">
												<!-- 새글 a 'new' class 추가-->
												<p>인재양성교육원에서 알려드립니다.</p> <span>2023-09-07</span>
										</a></li>

										<li><a
											href="/projectFinalFirst/selectNotice.do?ntc_no=3&rn=3">
												<!-- 새글 a 'new' class 추가-->
												<p>현재 많은 비가 내리고 있습니다.</p> <span>2023-09-01</span>
										</a></li>

										<li><a
											href="/projectFinalFirst/selectNotice.do?ntc_no=5&rn=5">
												<!-- 새글 a 'new' class 추가-->
												<p>마지막 안내사항입니다.</p> <span>2023-09-09</span>
										</a></li>

									</ul>
								</div>

								<a href="/projectFinalFirst/selectNoticeList.do"
									class="btn_more" title="공지사항 더보기">+<i class="xi-plus"
									aria-hidden="true"></i>
									<div class="hid">공지사항</div></a>

							</div>
							<!-- 공지사항 -->
						</div>


					</div>

					<div class="container">
						<div class="MC_box6">
							<!-- 팝업존 -->
							<div class="box_popup" id="popup">
								<h2 class="hid">팝업존</h2>
								<div class="pop" id="popupSlider">










									<div class="item" id="1">
										<a href="https://www.지진안전.com" target="_blank"><img
											src="images/zx.png" alt="2023년 지진안전주간 캠페인 홍보(새창)"></a>
									</div>









									<div class="item" id="2">
										<a href="#none" onclick="javascript:mfn_fileDownload(18960)"
											title="2023년 안전한 개인정보보호 사례 공모전 기간연장"><img
											src="images/qw.png" alt="2023년 안전한 개인정보보호 사례 공모전 기간연장(새창)"></a>
									</div>











									<div class="item" id="3">
										<a href="#none" onclick="javascript:mfn_fileDownload(18958)"
											title="2023년 안전한 개인정보보호 사례 공모전 기간연장"><img
											src="images/as.png" alt="2023년 안전한 개인정보보호 사례 공모전 기간연장(새창)"></a>
									</div>









									<div class="item" id="4">
										<a href="https://youtu.be/bLmBgNaWoNk" target="_blank"><img
											src="images/dd.png" alt="2023 양성평등주간 홍보(새창)"></a>
									</div>







									<div class="item" id="5">
										<a
											href="https://www.gne.go.kr/budget/index.gne?menuCd=DOM_000003901004000000"
											target="_blank"><img src="images/cc.png"
											alt="2024년도 경상남도교육청 예산편성 설문조사(새창)"></a>
									</div>


								</div>
								<div class="control">
									<a href="#popup" data-rel="prev" class="prev" title="이전"><i
										class="xi-arrow-left" aria-hidden="true"></i>
										<div class="hid">이전</div></a> <a href="#popup" data-rel="stop"
										class="stop" title="정지"><i class="xi-pause-circle-o"
										aria-hidden="true"></i>
										<div class="hid">정지</div></a> <a href="#popup" data-rel="play"
										class="play" title="재생" style="display: none;"><i
										class="xi-play-circle-o" aria-hidden="true"></i>
										<div class="hid">재생</div></a> <a href="#popup" data-rel="next"
										class="next" title="다음"><i class="xi-arrow-right"
										aria-hidden="true"></i>
										<div class="hid">다음</div></a>
									<p class="page">
										<strong>1</strong><span>11</span>
									</p>
								</div>
							</div>
							<!-- //팝업존 -->
						</div>

						<div class="MC_box7">
							<!-- 포토뉴스 -->
							<div class="news">
								<h2>대구 소식</h2>
								<div class="list_box">
									<div class="slider">

										<div class="item">
											<a href="https://www.youtube.com/shorts/ICIKYb6qMiE"
												target="_self"> <span class="img"><img
													src="images/1.png" alt="2023.dip"></span>
												<div class="cont">칠곡초 농구부 우승!</div>
											</a>
										</div>

										<div class="item">
											<a href="https://www.youtube.com/shorts/pkeROih_41I"
												target="_self"> <span class="img"><img
													src="images/2.png" alt="2023.dip1"></span>
												<div class="cont">[놀면국어하니?]</div>
											</a>
										</div>

										<div class="item">
											<a href="https://www.youtube.com/shorts/WqbUSi63s1E"
												target="_self"> <span class="img"><img
													src="images/3.png" alt="2023.dip2"></span>
												<div class="cont">공동교육과정 수강신청</div>
											</a>
										</div>


									</div>
								</div>

								<a
									href="https://www.dge.go.kr/pr/na/ntt/selectNttList.do?mi=5283&bbsId=1878"
									class="btn_more" title="대구 소식 더보기">+<i class="xi-plus"
									aria-hidden="true"></i>
									<div class="hid">대구 소식 더보기</div></a>

							</div>
							<!-- //포토뉴스 -->
						</div>
					</div>

				</div>

				<!-- bannerZone -->

			</div>
		</div>
		<!-- //container -->

		<!-- footer -->

		<footer id="footer">
			<div class="area_footer">
				<div class="box_footer">
					<div class="box_footer_left">
						<div class="footer_link">
							<div class="footer_link">
								<ul>
									<li class="point"><a
										href="/gneti/na/ntt/selectNttList.do?mi=12583&bbsId=4888">개인정보처리방침</a></li>
									<li><a
										href="/gneti/cm/cntnts/cntntsView.do?mi=12569&cntntsId=6640">찾아오시는길</a></li>
								</ul>
							</div>
						</div>
						<div class="box_info clearfix">
							<address>주소 : (우) 대구광역시 알파시티1로 170 TEL : 055-279-9001</address>
							<p class="copyright">Copyright ⓒ 대구디지털혁신진흥원 All rights
								reserved.</p>
						</div>
					</div>
				</div>
				<!-- top 버튼 위치이동 -->
				<div class="btn_top">
					<a href="" class="top"><i class="xi-arrow-up"
						aria-hidden="true"></i>TOP</a>
				</div>
			</div>
		</footer>


		<!-- // footer -->
	</div>
</body>
</html>
