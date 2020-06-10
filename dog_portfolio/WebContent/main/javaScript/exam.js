 $(document).ready(function () {
     $('.sidenav').sidenav();
     $('select').formSelect();
     $('.tabs').tabs();
     $(".overlay").hide();
     
     $(".img-thumbnail").hover(function () {
         $(".overlay").hide();
         $(this).parent().nextAll().show();
     });
     init();
 });

 function init() {
     var xhr;
     var xhr_sido;
     var xhr_sigungu;
     var xhr_care;
     var xhr_kind;
     getSido();

     var pageNum = 1;
     var buttonList = document.getElementById("myButtons");
     var tableList = document.getElementById("myTbody");

     while (buttonList.hasChildNodes()) {
         buttonList.removeChild(buttonList.firstChild);
     }

     searchQuery(pageNum);

     var next = document.createElement("INPUT");
     next.setAttribute("type", "button");
     next.setAttribute("id", "btnNext");
     next.value = '다음 >>';

     document.getElementById("myButtons").appendChild(next);

     document.getElementById("btnNext").onclick = function () {
         pageNum = pageNum + 1;
         while (tableList.hasChildNodes()) {
             tableList.removeChild(tableList.firstChild);
         }

         searchQuery(pageNum);

         while (buttonList.hasChildNodes()) {
             buttonList.removeChild(buttonList.firstChild);
         }

         if (pageNum != 1) {
             var before = document.createElement("INPUT");
             before.setAttribute("type", "button");
             before.setAttribute("id", "btnBefore");
             before.value = '<< 이전';

             document.getElementById("myButtons").appendChild(before);
             document.getElementById("myButtons").appendChild(next);
             document.getElementById("btnBefore").onclick = function () {
                 pageNum = pageNum - 1;
                 var tableList = document.getElementById("myTbody");

                 while (buttonList.hasChildNodes()) {
                     buttonList.removeChild(buttonList.firstChild);
                 }
                 while (tableList.hasChildNodes()) {
                     tableList.removeChild(tableList.firstChild);
                 }

                 if (pageNum != 1) {
                     document.getElementById("myButtons").appendChild(before);

                 }
                 document.getElementById("myButtons").appendChild(next);
                 searchQuery(pageNum);
             };
         }
     };

     document.getElementById("btnSearch").onclick = function () {
         var pageNum = 1;
         var buttonList = document.getElementById("myButtons");
         var tableList = document.getElementById("myTbody");

         while (buttonList.hasChildNodes()) {
             buttonList.removeChild(buttonList.firstChild);
         }

         searchQuery(pageNum);

         var next = document.createElement("INPUT");
         next.setAttribute("type", "button");
         next.setAttribute("id", "btnNext");
         next.value = '다음 >>';

         document.getElementById("myButtons").appendChild(next);

         document.getElementById("btnNext").onclick = function () {
             pageNum = pageNum + 1;
             while (tableList.hasChildNodes()) {
                 tableList.removeChild(tableList.firstChild);
             }

             searchQuery(pageNum);

             while (buttonList.hasChildNodes()) {
                 buttonList.removeChild(buttonList.firstChild);
             }

             if (pageNum != 1) {
                 var before = document.createElement("INPUT");
                 before.setAttribute("type", "button");
                 before.setAttribute("id", "btnBefore");
                 before.value = '<< 이전';

                 document.getElementById("myButtons").appendChild(before);
                 document.getElementById("myButtons").appendChild(next);
                 
                 document.getElementById("btnBefore").onclick = function () {
                     pageNum = pageNum - 1;
                     var tableList = document.getElementById("myTbody");

                     while (buttonList.hasChildNodes()) {
                         buttonList.removeChild(buttonList.firstChild);
                     }
                     while (tableList.hasChildNodes()) {
                         tableList.removeChild(tableList.firstChild);
                     }

                     if (pageNum != 1) {
                         document.getElementById("myButtons").appendChild(before);
                     }
                     document.getElementById("myButtons").appendChild(next);
                     searchQuery(pageNum);
                 };
             }
         };
     };

     var select_sido = document.getElementById("upr_cd").addEventListener('change', function (e) {
         var selList = document.getElementById("org_cd");
         var careList = document.getElementById("care");
         while (selList.hasChildNodes()) {
             selList.removeChild(selList.firstChild);
         }
         while (careList.hasChildNodes()) {
             careList.removeChild(careList.firstChild);
         }
         getSigungu();
     });

     var select_sigugun = document.getElementById("org_cd").addEventListener('change', function (e) {
         var selList_care = document.getElementById("care");
         while (selList_care.hasChildNodes()) {
             selList_care.removeChild(selList_care.firstChild);
         }
         getCare();
     });

     var select_care = document.getElementById("care").addEventListener('change', function (e) {
         var careNum = document.getElementById("care").value;
         document.getElementById("care_reg_no").value = careNum;
     });

     var select_upkind = document.getElementById("upkind").addEventListener('change', function (e) {
         var selList_kind = document.getElementById("kind");
         while (selList_kind.hasChildNodes()) {
             selList_kind.removeChild(selList_kind.firstChild);
         }
         getKind();
     });
 }

 function getSido() {
     xhr_sido = new XMLHttpRequest();
     var url = 'https://cors-anywhere.herokuapp.com/http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido'; /*URL*/
     var queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + '79E1WBI0%2BQz7gO1P7FxFKLrZShN2Dnh%2FvroCCFHUp6uRuCQARB6VAjdZ7VUefdbsDnWrR9ytlxZXlUxNo7KVCQ%3D%3D'; /*Service Key*/
     xhr_sido.open('GET', url + queryParams);
     xhr_sido.onreadystatechange = function () {
         if (this.readyState == 4) {
             makeSidoSelect();
             $('select').formSelect();
         }
     };
     xhr_sido.send('');
 }

 function makeSidoSelect() {
     var data = xhr_sido.responseXML;
     var item = data.getElementsByTagName("item");
     var option_a = 'optiona_' + i;
     var option_a = document.createElement("option");
     option_a.value = '';
     var text = '전체';
     option_a.appendChild(document.createTextNode(text));
     document.getElementById("upr_cd").appendChild(option_a);

     for (var i = 0; i < item.length; i++) {
         var option_1 = 'option1_' + i;
         var option_1 = document.createElement("option");
         var orgCd = data.getElementsByTagName("orgCd")[i].firstChild.data;;
         option_1.value = orgCd;
         var orgdownNm = data.getElementsByTagName("orgdownNm")[i].firstChild.data;
         option_1.appendChild(document.createTextNode(orgdownNm));
         document.getElementById("upr_cd").appendChild(option_1);
     }
 }

 function getSigungu() {
     xhr_sigungu = new XMLHttpRequest();
     var url = 'https://cors-anywhere.herokuapp.com/http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu'; /*URL*/
     var queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + '79E1WBI0%2BQz7gO1P7FxFKLrZShN2Dnh%2FvroCCFHUp6uRuCQARB6VAjdZ7VUefdbsDnWrR9ytlxZXlUxNo7KVCQ%3D%3D'; /*Service Key*/
     queryParams += '&' + encodeURIComponent('upr_cd') + '=' + document.getElementById("upr_cd").value; /*시군구 상위코드(시도코드) (입력 시 데이터 O, 미입력 시 데이터 X) */
     xhr_sigungu.open('GET', url + queryParams);
     xhr_sigungu.onreadystatechange = function () {
         if (this.readyState == 4) {
             makeSigunguSelect();
             $('select').formSelect();
         }
     };
     xhr_sigungu.send('');
 }

 function makeSigunguSelect() {
     var data = xhr_sigungu.responseXML;
     var item = data.getElementsByTagName("item");
     var option_b = 'optionb_' + i;
     var option_b = document.createElement("option");
     option_b.value = '';
     var text = '전체';
     option_b.appendChild(document.createTextNode(text));
     document.getElementById("org_cd").appendChild(option_b);

     for (var i = 0; i < item.length; i++) {
         var option_2 = 'option2_' + i;
         var option_2 = document.createElement("option");
         var orgCd = data.getElementsByTagName("orgCd")[i].firstChild.data;;
         option_2.value = orgCd;
         var orgdownNm = data.getElementsByTagName("orgdownNm")[i].firstChild.data;
         option_2.appendChild(document.createTextNode(orgdownNm));
         document.getElementById("org_cd").appendChild(option_2);
     }
 }

 function getCare() {
     xhr_care = new XMLHttpRequest();
     var url = 'https://cors-anywhere.herokuapp.com/http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/shelter'; /*URL*/
     var queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + '79E1WBI0%2BQz7gO1P7FxFKLrZShN2Dnh%2FvroCCFHUp6uRuCQARB6VAjdZ7VUefdbsDnWrR9ytlxZXlUxNo7KVCQ%3D%3D'; /*Service Key*/
     queryParams += '&' + encodeURIComponent('upr_cd') + '=' + document.getElementById("upr_cd").value; /*시도코드(입력 시 데이터 O, 미입력 시 데이터 X)*/
     queryParams += '&' + encodeURIComponent('org_cd') + '=' + document.getElementById("org_cd").value; /*시군구코드(입력 시 데이터 O, 미입력 시 데이터 X)*/
     xhr_care.open('GET', url + queryParams);
     xhr_care.onreadystatechange = function () {
         if (this.readyState == 4) {
             makeCareSelect();
             $('select').formSelect();
         }
     };
     xhr_care.send('');
 }

 function makeCareSelect() {
     var data = xhr_care.responseXML;
     var item = data.getElementsByTagName("item");
     var option_c = 'optionc_' + i;
     var option_c = document.createElement("option");
     option_c.value = '';
     var text = '전체';
     option_c.appendChild(document.createTextNode(text));
     document.getElementById("care").appendChild(option_c);

     for (var i = 0; i < item.length; i++) {
         var option_3 = 'option3_' + i;
         var option_3 = document.createElement("option");
         var careRegNo = data.getElementsByTagName("careRegNo")[i].firstChild.data;;
         option_3.value = careRegNo;
         var careNm = data.getElementsByTagName("careNm")[i].firstChild.data;
         option_3.appendChild(document.createTextNode(careNm));
         document.getElementById("care").appendChild(option_3);
     }
     var careNum = document.getElementById("care").value;
     document.getElementById("care_reg_no").value = careNum;
 }

 function getKind() {
     xhr_kind = new XMLHttpRequest();
     var url = 'https://cors-anywhere.herokuapp.com/http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind'; /*URL*/
     var queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + '79E1WBI0%2BQz7gO1P7FxFKLrZShN2Dnh%2FvroCCFHUp6uRuCQARB6VAjdZ7VUefdbsDnWrR9ytlxZXlUxNo7KVCQ%3D%3D'; /*Service Key*/
     queryParams += '&' + encodeURIComponent('up_kind_cd') + '=' + document.getElementById("upkind").value; /*축종코드(입력 시 데이터 O, 미입력 시 데이터 X) 축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
     xhr_kind.open('GET', url + queryParams);
     xhr_kind.onreadystatechange = function () {
         if (this.readyState == 4) {
             makeKindSelect();
             $('select').formSelect();
         }
     };
     xhr_kind.send('');
 }

 function makeKindSelect() {
     var data = xhr_kind.responseXML;
     var item = data.getElementsByTagName("item");
     var option_d = 'optiond_' + i;
     var option_d = document.createElement("option");
     option_d.value = '';
     var text = '전체';
     option_d.appendChild(document.createTextNode(text));
     document.getElementById("kind").appendChild(option_d);

     for (var i = 0; i < item.length; i++) {
         var option_4 = 'option4_' + i;
         var option_4 = document.createElement("option");
         var kindCd = data.getElementsByTagName("kindCd")[i].firstChild.data;;
         option_4.value = kindCd;
         var KNm = data.getElementsByTagName("KNm")[i].firstChild.data;
         option_4.appendChild(document.createTextNode(KNm));
         document.getElementById("kind").appendChild(option_4);
     }
 }

 function searchQuery(pageNum) {
     var bgnde = document.getElementById("bgnde").value.replace("-", "");
     var endde = document.getElementById("endde").value.replace("-", "");
     xhr = new XMLHttpRequest();
     
     var url = 'https://cors-anywhere.herokuapp.com/http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
     var queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + '79E1WBI0%2BQz7gO1P7FxFKLrZShN2Dnh%2FvroCCFHUp6uRuCQARB6VAjdZ7VUefdbsDnWrR9ytlxZXlUxNo7KVCQ%3D%3D'; /*Service Key*/
     queryParams += '&' + encodeURIComponent('bgnde') + '=' + bgnde; /*유기날짜 (검색 시작일) (YYYYMMDD) */
     queryParams += '&' + encodeURIComponent('endde') + '=' + endde; /*유기날짜 (검색 종료일) (YYYYMMDD) */
     queryParams += '&' + encodeURIComponent('upkind') + '=' + document.getElementById("upkind").value; /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
     queryParams += '&' + encodeURIComponent('kind') + '=' + document.getElementById("kind").value; /*품종코드 (품종 조회 OPEN API 참조) */
     queryParams += '&' + encodeURIComponent('upr_cd') + '=' + document.getElementById("upr_cd").value; /*시도코드 (시도 조회 OPEN API 참조) */
     queryParams += '&' + encodeURIComponent('org_cd') + '=' + document.getElementById("org_cd").value; /*시군구코드 (시군구 조회 OPEN API 참조) */
     queryParams += '&' + encodeURIComponent('care_reg_no') + '=' + document.getElementById("care_reg_no").value; /*보호소번호 (보호소 조회 OPEN API 참조) */
     queryParams += '&' + encodeURIComponent('state') + '=' + document.getElementById("state").value; /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
     queryParams += '&' + encodeURIComponent('pageNo') + '=' + pageNum; /*페이지 번호*/
     queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('12'); /*페이지당 보여줄 개수*/
     queryParams += '&' + encodeURIComponent('neuter_yn') + '=' + document.getElementById("neuter_yn").value; /*중성화여부*/
     queryParams += '&' + encodeURIComponent('pageSize') + '=' + encodeURIComponent('10'); /*페이지사이즈*/
     xhr.open('GET', url + queryParams);
     xhr.onreadystatechange = function () {
         if (this.readyState == 4) {
             makeTable();
         }
     };
     xhr.send('');
 }

 function makeTable() {
     var animal_info_kor = ['나이', '색상', '품종', '중성화여부', '성별', '특징', '체중'];
     var animal_info_eng = ['age', 'colorCd', 'kindCd', 'neuterYn', 'sexCd', 'specialMark', 'weight'];
     var abandonment_info_kor = ['유기번호', '접수일', '발견장소'];
     var abandonment_info_eng = ['desertionNo', 'happenDt', 'happenPlace'];
     var notice_info_kor = ['공고번호', '공고시작일', '공고종료일', '관할기관', '상태'];
     var notice_info_eng = ['noticeNo', 'noticeSdt', 'noticeEdt', 'orgNm', 'processState'];
     var care_info_kor = ['보호장소', '보호소이름', '보호소연락처', '담당자', '담당자연락처'];
     var care_info_eng = ['careAddr', 'careNm', 'careTel', 'chargeNm', 'officetel'];

     var data = xhr.responseXML;
     var total_count = data.getElementsByTagName("totalCount")[0].firstChild.data;
     var item = data.getElementsByTagName("item");

     if (total_count == 0) {
         var div_0 = document.createElement("div");
         div_0.id = "div_0";
         div_0.className = 'center';
         div_0.innerHTML = "<h3>검색 결과가 없습니다.<h3><br>";
         document.getElementById("myTbody").appendChild(div_0);
     } else {
         for (var i = 0; i < item.length; i++) {
             if (i < 10) {
                 var docName = "#main0" + i;
             } else {
                 var docName = "#main" + i;
             }

             if (data.getElementsByTagName("popfile")[i] == undefined) {
                 popfile_url = "없음";
             } else {
                 popfile_url = data.getElementsByTagName("popfile")[i].firstChild.data;
             }

             var target_img = docName;
             $(target_img).attr("src", popfile_url);

             animal_info_text = '';
             for (var j = 0; j < animal_info_eng.length; j++) {
                 animal_info_text += animal_info_kor[j] + ' : ';

                 if (data.getElementsByTagName(animal_info_eng[j])[i] == undefined) {
                     animal_info_text += "없음 <br/>";
                 } else {
                     animal_info_text += data.getElementsByTagName(animal_info_eng[j])[i].firstChild.data + "<br/>";
                 }
             }

             var target_text1 = docName + "_text1";
             $(target_text1).html(animal_info_text);

             abandonment_info_text = '';
             for (var j = 0; j < abandonment_info_eng.length; j++) {
                 abandonment_info_text += abandonment_info_kor[j] + ' : ';

                 if (data.getElementsByTagName(abandonment_info_eng[j])[i] == undefined) {
                     abandonment_info_text += "없음 <br/>";
                 } else {
                     abandonment_info_text += data.getElementsByTagName(abandonment_info_eng[j])[i].firstChild.data + "<br/>";
                 }
             }

             var target_text2 = docName + "_text2";
             $(target_text2).html(abandonment_info_text);

             notice_info_text = '';
             for (var j = 0; j < notice_info_eng.length; j++) {
                 notice_info_text += notice_info_kor[j] + ' : ';

                 if (data.getElementsByTagName(notice_info_eng[j])[i] == undefined) {
                     notice_info_text += "없음 <br/>";
                 } else {
                     notice_info_text += data.getElementsByTagName(notice_info_eng[j])[i].firstChild.data + "<br/>";
                 }
             }

             var target_text3 = docName + "_text3";
             $(target_text3).html(notice_info_text);

             
             
             care_info_text = '';
             for (var j = 0; j < care_info_eng.length; j++) {
                 care_info_text += care_info_kor[j] + ' : ';

                 if (data.getElementsByTagName(care_info_eng[j])[i] == undefined) {
                     care_info_text += "없음 <br/>";
                 } else {
                     care_info_text += data.getElementsByTagName(care_info_eng[j])[i].firstChild.data + "<br/>";
                 }
             }
             
             var target_text4 = docName + "_text4";
             $(target_text4).html(care_info_text);
         }
     }
 }