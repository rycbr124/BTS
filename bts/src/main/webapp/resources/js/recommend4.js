/**
 * 추천(지역별) - 한국관광공사 API 
 */
function result_init(){
	 var pageNo = 1;
	 image_init(pageNo);//이미지 삽입
	 //paging 뿌리는 메소드
	 $('.page-item').on('click',paging_click); //뿌린 버튼에 클릭이벤트 달아주는 메소드
}

function image_init(idNumber) {
$("#image_grid").empty();
	
	var serviceKey = 'dt2Nu%2Bu9tgj6Kwy1XIKjBFD8Ns8Etgi2jM6AuzJpQ1Hs%2Fy3WN2RSZU8PnK3MG15kw2UPyDjHSnaBkw7GTASqHA%3D%3D'
	var reqUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=' + serviceKey + '&contentId=' + idNumber + '&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y';
	
	$.ajax({
		async : false,
		url : reqUrl,
		dataType : 'json',
		success : function(data, textStatus) {
			var resultArray = data.response.body.items.item;
			console.log(resultArray)
			console.log(resultArray.mapx);
			console.log(resultArray.mapy);
			console.log("12121212");
			
			var img_1 = document.createElement('img');
			$(img_1).prop('class', 'img-fluid rounded mb-4 mb-lg-0');
			$(img_1).prop('src', resultArray.firstimage);
			
			var title = document.createElement('h1');
			$(title).prop('class', 'font-weight-light');
			var title_text = document.createTextNode(resultArray.title);
			title.appendChild(title_text);
			
			var overview = document.createElement('p');
			var overview_text = document.createTextNode(resultArray.overview);
			$(overview).html(resultArray.overview);
			
			$('.col-lg-7').append(img_1);

			$('.col-lg-5').append(title);
			$('.col-lg-5').append(overview);
			
			map_print(resultArray.title, resultArray.mapx, resultArray.mapy);
		},
		error : function(data, textStatus) {
			alert("잘못된 접근입니다.")
		}
	});
	course_detail(idNumber);
}

function course_detail(idNumber) {
	$("#image_grid").empty();
	
	var serviceKey = 'dt2Nu%2Bu9tgj6Kwy1XIKjBFD8Ns8Etgi2jM6AuzJpQ1Hs%2Fy3WN2RSZU8PnK3MG15kw2UPyDjHSnaBkw7GTASqHA%3D%3D'
	var reqUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=' + serviceKey + '&contentTypeId=25&contentId=' + idNumber + '&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y';
	
	$.ajax({
		async : false,
		url : reqUrl,
		dataType : 'json',
		success : function(data, textStatus) {
			var result_length = data.response.body.items.item.length
			
			for(var i = 0; i < result_length; i++){
						
				var resultArray = data.response.body.items.item[i];
				console.log("222222222222 : " + resultArray.subname);
				
				var content_div = document.createElement('div');
				$(content_div).prop('class', 'content_' + i);
				var title = document.createElement('strong');
				var text_title = document.createTextNode(resultArray.subname);
				title.appendChild(text_title);
				
				$('.content').append(content_div);
				$('.content_' + i).append(title);
			}
		},
		error : function(data, textStatus) {
			alert("잘못된 접근입니다.")
		}
	});
}




function map_print(title, mapx, mapy){
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(mapy, mapx), //지도의 중심좌표. //여기에 먼저 좌표 설정
			level: 6 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(mapy, mapx);  //여기도 위에 좌표랑 똑같이 입력
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">' + title + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(mapy, mapx); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
}