<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
//검색창 가져오는 부분
String kind2 = request.getParameter("kind");
SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
Calendar time2 = Calendar.getInstance();
String nowdate = date.format(time2.getTime());

SimpleDateFormat dateS = new SimpleDateFormat("yyyy-MM-dd");
Calendar timeS = Calendar.getInstance();
String startDate = dateS.format(timeS.getTime());

String bgnde, endde, upkind, kind, upr_cd, org_cd, care_reg_no, state, neuter_yn = null;

StringBuilder urlBuilder2 = new StringBuilder(
		"http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido"); /*URL*/
urlBuilder2.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
		+ "=QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D"); /*Service Key*/
URL url2 = new URL(urlBuilder2.toString());
HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
conn2.setRequestMethod("GET");
conn2.setRequestProperty("Content-type", "application/json");

DocumentBuilderFactory dbFactory2 = DocumentBuilderFactory.newInstance();
DocumentBuilder dBuilder2 = dbFactory2.newDocumentBuilder();
Document doc2 = dBuilder2.parse(url2.openStream());

doc2.getDocumentElement().normalize();
NodeList nList2 = doc2.getElementsByTagName("item");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기동물 조회</title>
<link rel="stylesheet" type="text/css"
	href="../main/css/main_css/main_top_petFind.css">
<link rel="stylesheet" type="text/css"
	href="../main/css/search_css/div.css">
<link rel="stylesheet" type="text/css"
	href="../main/css/search_css/search_bar.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../main/include/main_header.jsp"></jsp:include>
	<section>
		<div id="search_container">
			<form action="find.do" method="get" name="find_form">
				<table id="search_table">
					<tr>
						<th>시 도</th>
						<td><select id="upr_cd" name="upr_cd">
								<option value="">전체</option>
								<%
									for (int i = 0; i < nList2.getLength(); i++) {
									Node nNode2 = nList2.item(i);
									Element element2 = (Element) nNode2;

									NodeList orgCd = element2.getElementsByTagName("orgCd").item(0).getChildNodes();
									Node orgCdV = orgCd.item(0);
									NodeList orgdownNm = element2.getElementsByTagName("orgdownNm").item(0).getChildNodes();
									Node orgdownNmV = orgdownNm.item(0);
								%>
								<option value="<%=orgCdV.getNodeValue()%>"><%=orgdownNmV.getNodeValue()%>
									<%
										}
									%>
								
						</select></td>
						<th>시 군 구</th>
						<td><select id="org_cd" name="org_cd">
								<option value="">전체</option>
						</select></td>
						<th>보호소 이름</th>
						<td><select id="care" name="care">
								<option value="">전체</option>
						</select></td>
						<th>보호소 번호</th>
						<td><input type="text" id="care_reg_no" name="care_reg_no"></td>
						<th>상태</th>
						<td><select id="state" name="state">
								<option value="">전체</option>
								<option value="notice">공고중</option>
								<option value="protect">보호중</option>
						</select></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><input type="date" id="bgnde" value="<%=startDate%>"
							min="2014-06-01" name="bgnde"></td>
						<th>종료일</th>
						<td><input type="date" id="endde" name="endde"
							value="<%=nowdate%>"></td>
						<th>종류</th>
						<td><select id="upkind" name="upkind">
								<%
									if (kind2 == null || kind2.equals("")) {
								%>
								<option value="">전체</option>
								<option value="417000">개</option>
								<option value="422400">고양이</option>
								<option value="429900">기타</option>
								<%
									} else if (kind2.equals("dog")) {
								%>
								<option value="">전체</option>
								<option value="417000" selected="selected">개</option>
								<option value="422400">고양이</option>
								<option value="429900">기타</option>
								<%
									} else if (kind2.equals("cat")) {
								%>
								<option value="">전체</option>
								<option value="417000">개</option>
								<option value="422400" selected="selected">고양이</option>
								<option value="429900">기타</option>
								<%
									}
								%>
						</select></td>
						<th>품종</th>
						<td><select id="kind" name="kind"></select></td>
						<th>중성화 여부</th>
						<td><select id="neuter_yn" name="neuter_yn">
								<option value="">전체</option>
								<option value="Y">예</option>
								<option value="N">아니오</option>
								<option value="U">미상</option>
						</select></td>
				</table>
				<input type="submit" value="검색" id="search_btn">
			</form>
		</div>


		<div id="div_container_dog">
			<%
				//리스트 가져오는 부분
			String count = request.getParameter("count");
			if (count == null) {
				count = "1";
			} else if (count.equals("0")) {
				out.println("<script>");
				out.println("alert('첫번째 페이지입니다.')");
				out.println("location.href='list.do'");
				out.println("</script>");
			}

			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?"); /*URL*/
			if (request.getAttribute("bgnde") == null) {
				bgnde = "";
				endde = "";
			} else {
				bgnde = (String) request.getAttribute("bgnde");
				endde = (String) request.getAttribute("endde");
			}
			urlBuilder.append("bgnde=" + bgnde);
			urlBuilder.append("&endde=" + endde);
			if (request.getAttribute("upkind") == null) {
				upkind = "";
			} else {
				upkind = (String) request.getAttribute("upkind");
			}
			urlBuilder.append("&upkind=" + upkind);
			if (request.getAttribute("kind") == null) {
				kind = "";
			} else {
				kind = (String) request.getAttribute("kind");
			}
			urlBuilder.append("&kind=" + kind);
			if (request.getAttribute("upr_cd") == null) {
				upr_cd = "";
			} else {
				upr_cd = (String) request.getAttribute("upr_cd");
			}
			urlBuilder.append("&upr_cd=" + upr_cd);
			if (request.getAttribute("org_cd") == null) {
				org_cd = "";
			} else {
				org_cd = (String) request.getAttribute("org_cd");
			}
			urlBuilder.append("&org_cd=" + org_cd);
			if (request.getAttribute("care_reg_no") == null) {
				care_reg_no = "";
			} else {
				care_reg_no = (String) request.getAttribute("care_reg_no");
			}
			urlBuilder.append("&care_reg_no=" + care_reg_no);
			if (request.getAttribute("state") == null) {
				state = "";
			} else {
				state = (String) request.getAttribute("state");
			}
			urlBuilder.append("&state=" + state);
			urlBuilder.append("&pageNo=" + count);
			urlBuilder.append("&numOfRows=" + "12");
			if (request.getAttribute("neuter_yn") == null) {
				neuter_yn = "";
			} else {
				neuter_yn = (String) request.getAttribute("neuter_yn");
			}
			urlBuilder.append("&neuter_yn=" + neuter_yn);
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8")
					+ "=QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D"); /*Service Key*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url.openStream());

			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");

			NodeList no = doc.getElementsByTagName("body");
			Node pageNode = no.item(0);
			Element pe = (Element) pageNode;
			NodeList page11 = pe.getElementsByTagName("totalCount").item(0).getChildNodes();
			Node pageV = page11.item(0);
			%>
			<%
				for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				Element element = (Element) nNode;

				NodeList desertionNo = element.getElementsByTagName("desertionNo").item(0).getChildNodes(); //유기번호
				Node desertionNoV = desertionNo.item(0);
				NodeList kindcd = element.getElementsByTagName("kindCd").item(0).getChildNodes(); //품종 -
				Node kindcdV = kindcd.item(0);
				NodeList color = element.getElementsByTagName("colorCd").item(0).getChildNodes(); //색상 -
				Node colorV = color.item(0);
				NodeList age = element.getElementsByTagName("age").item(0).getChildNodes(); //나이 -
				Node ageV = age.item(0);
				NodeList weight = element.getElementsByTagName("weight").item(0).getChildNodes(); //체중 -
				Node weightV = weight.item(0);
				NodeList popfile = element.getElementsByTagName("popfile").item(0).getChildNodes(); //큰이미지 -
				Node popfileV = popfile.item(0);
				NodeList processState = element.getElementsByTagName("processState").item(0).getChildNodes(); //상태
				Node processStateV = processState.item(0);
				NodeList sex = element.getElementsByTagName("sexCd").item(0).getChildNodes(); //성별 -
				Node sexV = sex.item(0);
				NodeList neuter = element.getElementsByTagName("neuterYn").item(0).getChildNodes(); //중성화여부 -
				Node neuterV = neuter.item(0);
				NodeList specialMark = element.getElementsByTagName("specialMark").item(0).getChildNodes(); //특징 -
				Node specialV = specialMark.item(0);
			%>
			<div id="first_div" class="first_dog_div">
				<div id="img_div">
					<img alt="사진" src="<%=popfileV.getNodeValue()%>" width="100%"
						height="300px" id="dog_img">
					<div id="second_div">
						나이 :
						<%=ageV.getNodeValue()%><br> 색상 :
						<%=colorV.getNodeValue()%><br> 품종 :
						<%=kindcdV.getNodeValue()%><br> 중성화 :
						<%=neuterV.getNodeValue()%><br> 성별 :
						<%=sexV.getNodeValue()%><br> 특징 :
						<%=specialV.getNodeValue()%><br> 체중 :
						<%=weightV.getNodeValue()%><br> <br> <a
							href="dog_info.do?pageNo=<%=count%>&bgnde=<%=bgnde%>&endde=<%=endde%>&desertionNo=<%=desertionNoV.getNodeValue()%>
							&upr_cd=<%=upr_cd%>&org_cd=<%=org_cd%>&upkind=<%=upkind%>&kind=<%=kind%>&state=<%=state%>&neuter_yn<%=neuter_yn%>">상세정보</a>
					</div>
				</div>

			</div>
			<%
				}
			conn.disconnect();
			%>
			<div id="page_button">
				<input class="page_button_input" type="button" value="처음"
					onclick="location.href='list.do?count=1'"> <input
					class="page_button_input" type="button" value="이전"
					onclick="location.href='list.do?count=<%=Integer.parseInt(count) - 1%>'">
				<input class="page_button_input" type="button" value="다음"
					onclick="next_check(<%=Integer.parseInt(count) + 1%>,<%=(Integer.parseInt(pageV.getNodeValue()) / 12) + 1%>);">
				<input class="page_button_input" type="button" value="마지막"
					onclick="last_check(<%=(Integer.parseInt(pageV.getNodeValue()))%>);">
			</div>
		</div>
		<script type="text/javascript">
			function next_check(next, last){
				if(last < next){
					alert('마지막 페이지입니다.');
					location.href='list.do?count='+last;
				} else{
					location.href='list.do?count='+next;
				}
			}
			
			function last_check(last){
				if(last % 12 == 0){
					location.href='list.do?count='+last;
					history.back();
				} else{
					location.href='list.do?count='+(parseInt(last/12)+1);
				}
			}
		</script>
	</section>
	<script type="text/javascript" src="../main/javaScript/search.js"></script>
</body>
</html>