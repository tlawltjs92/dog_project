/**
 * http://usejsdoc.org/
 */



document.getElementById('endde').value = new Date().toISOString().substring(0, 10); //종료시간 현재시간으로 맞춰줌
document.getElementById('endde').max = new Date().toISOString().substring(0, 10); //종료시간의 max값을 정해줌

$('#upr_cd').change(function(){ // 시도 코드
	
	$('#org_cd').empty();
	$('#care').empty();
	$('#care_reg_no').val('');
	
	var value = $("#upr_cd").val();
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(value); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        var data = xhr.responseXML;
	        var item = data.getElementsByTagName('item');
	         
	        var option_a = document.createElement("option");
	        option_a.value = '';
	        var text = '전체';
	        option_a.appendChild(document.createTextNode(text));
	        document.getElementById("org_cd").appendChild(option_a);
	        
	        
	        for(var i = 0 ; i < item.length ; i++){
	        	
	        	var option_2 = document.createElement("option");
	        	var orgCd = data.getElementsByTagName("orgCd")[i].firstChild.data;
	        	option_2.value = orgCd;
	        	var orgdownNm = data.getElementsByTagName("orgdownNm")[i].firstChild.data;
	        	option_2.appendChild(document.createTextNode(orgdownNm));
	        	document.getElementById("org_cd").appendChild(option_2);
	        }
	    }
	};
	xhr.send('');
});

$('#org_cd').change(function(){ // 시군구 코드
	
	$('#care').empty();
	$('#care_reg_no').val('');
	
	
	var value1 = $("#upr_cd").val();
	var value2 = $("#org_cd").val();
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/shelter'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(value1); /**/
	queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(value2); /**/
	xhr.open('GET', url + queryParams);
	
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        var data = xhr.responseXML;
	        var item = data.getElementsByTagName('item');
	        
	        var option_a = document.createElement("option");
	        option_a.value = '';
	        var text = '전체';
	        option_a.appendChild(document.createTextNode(text));
	        document.getElementById("care").appendChild(option_a);
	        
	        for(var i = 0 ; i < item.length ; i++){
	        	
	            var option_3 = document.createElement("option");
	            var careRegNo = data.getElementsByTagName("careRegNo")[i].firstChild.data;
	            option_3.value = careRegNo;
	            var careNm = data.getElementsByTagName("careNm")[i].firstChild.data;
	            option_3.appendChild(document.createTextNode(careNm));
	            document.getElementById("care").appendChild(option_3);
	        }
	    }
	};
	xhr.send('');
});

$('#care').change(function(){ // 보호소 번호 코드
    var careNum = document.getElementById("care").value;
    document.getElementById("care_reg_no").value = careNum;
});


$('#upkind').change(function() { //강아지 고양이 선택시 종류가 변경되는 부분
	$('#kind').empty();//강아지 종류 부분 초기화
	
	var kind = $('#upkind').val();
	
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind?'; /* URL */
	var queryParams = '&'
			+ encodeURIComponent('ServiceKey')
			+ '='
			+ 'QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D';
	queryParams += '&' + encodeURIComponent('up_kind_cd') + '='+ encodeURIComponent(kind); // 종류 값 받아옴
	xhr.open('GET', url + queryParams);

	xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
	        var data = xhr.responseXML;
	        var item = data.getElementsByTagName('item');

			var option_kind = document.createElement('option');
			option_kind.value = '';
			var text = '전체';
			option_kind.appendChild(document.createTextNode(text));
			document.getElementById("kind").appendChild(option_kind);

			for (var i = 0; i < item.length; i++) {
				
				var option_4 = document.createElement("option");
				var kindCd = data.getElementsByTagName("kindCd")[i].firstChild.data;
				option_4.value = kindCd;
				var KNm = data.getElementsByTagName("KNm")[i].firstChild.data;
				option_4.appendChild(document.createTextNode(KNm));
				document.getElementById("kind").appendChild(option_4);
			}
		}
	};
	xhr.send('');
	
});









$(document).ready(function(){ //강아지나 고양이 종류 시작할때 가져오는 부분
	var kind = $('#upkind').val();
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind?'; /* URL */
	var queryParams = '&'
			+ encodeURIComponent('ServiceKey')
			+ '='
			+ 'QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D';
	queryParams += '&' + encodeURIComponent('up_kind_cd') + '='+ encodeURIComponent(kind); // 종류 값 받아옴
	xhr.open('GET', url + queryParams);

	xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
	        var data = xhr.responseXML;
	        var item = data.getElementsByTagName('item');

			var option_kind = document.createElement('option');
			option_kind.value = '';
			var text = '전체';
			option_kind.appendChild(document.createTextNode(text));
			document.getElementById("kind").appendChild(option_kind);

			for (var i = 0; i < item.length; i++) {
				
				var option_4 = document.createElement("option");
				var kindCd = data.getElementsByTagName("kindCd")[i].firstChild.data;
				option_4.value = kindCd;
				var KNm = data.getElementsByTagName("KNm")[i].firstChild.data;
				option_4.appendChild(document.createTextNode(KNm));
				document.getElementById("kind").appendChild(option_4);
			}
		}
	};
	xhr.send('');
});



