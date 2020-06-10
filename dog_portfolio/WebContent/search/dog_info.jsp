<%@page
	import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//페이지 번호와 유기견 번호를 가져와서 값을 처리해주는 부분.
request.setCharacterEncoding("UTF-8");
String pageNo = (String) request.getParameter("pageNo");
String bgnde = (String) request.getParameter("bgnde");
String endde = (String) request.getParameter("endde");
String upr_cd = (String) request.getParameter("upr_cd");
String org_cd = (String) request.getParameter("org_cd");
String upkind = (String) request.getParameter("upkind");
String kind = (String) request.getParameter("kind");
String state = (String) request.getParameter("state");
String neuter_tn = (String) request.getParameter("neuter_yn");
String desertionNoS = (String) request.getParameter("desertionNo");

if (pageNo == null) {
	pageNo = "";
} else if (bgnde == null) {
	bgnde = "";
} else if (endde == null) {
	endde = "";
} else if (upr_cd == null) {
	upr_cd = "";
} else if (org_cd == null) {
	org_cd = "";
} else if (upkind == null) {
	upkind = "";
} else if (kind == null) {
	kind = "";
} else if (state == null) {
	state = "";
} else if (neuter_tn == null) {
	neuter_tn = "";
} else if (desertionNoS == null) {
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.')");
	out.println("location.href='list.do'");
	out.println("</script>");
}

System.out.println("상세보기에서 가져온 유기번호 : " + desertionNoS);

// 값을 가져오는 부분

StringBuilder urlBuilder = new StringBuilder(
		"http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
		+ "=QybLRdUzu2Xgs9gVcIkXGmVx4G%2Bp63b%2Bzg%2Fb6V33XLICbMQ4ibdLOwB0hCmQcfS%2BDsFXGKr8sasvTXQie7BYoA%3D%3D"); /*Service Key*/
urlBuilder.append("&bgnde=" + bgnde);
urlBuilder.append("&endde=" + endde);
urlBuilder.append("&upr_cd=" + upr_cd);
urlBuilder.append("&org_cd=" + org_cd);
urlBuilder.append("&upkind="+upkind);
urlBuilder.append("&kind="+kind);
urlBuilder.append("&state="+state);
urlBuilder.append("&neuter_tn="+neuter_tn);
urlBuilder.append("&pageNo=" + pageNo);
urlBuilder.append("&numOfRows=12");
URL url = new URL(urlBuilder.toString());
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-type", "application/json");
System.out.println("Response code: " + conn.getResponseCode());

//item의 태그부분의 길이를 구하기위해 가져옴.
DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
Document doc = dBuilder.parse(url.openStream());

doc.getDocumentElement().normalize();
NodeList nList = doc.getElementsByTagName("item");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기견 정보 페이지</title>
<link rel="stylesheet" type="text/css"
	href="../main/css/main_css/main_top_petFind.css">
<link rel="stylesheet" type="text/css"
	href="../main/css/search_css/dog_info.css">
</head>
<body>
	<jsp:include page="../main/include/main_header.jsp"></jsp:include>
	<%
		for (int i = 0; i < nList.getLength(); i++) {
		Node nNode = nList.item(i);
		Element element = (Element) nNode;

		NodeList desertionNo = element.getElementsByTagName("desertionNo").item(0).getChildNodes();
		Node desertionNoV = desertionNo.item(0);

		System.out.println("유기번호 찾는중 : " + desertionNoV.getNodeValue());

		if (desertionNoV.getNodeValue().equals(desertionNoS)) {

			System.out.println("find_Success");

			NodeList happenDt = element.getElementsByTagName("happenDt").item(0).getChildNodes(); //접수일
			Node happenDtV = happenDt.item(0);
			NodeList happenPlace = element.getElementsByTagName("happenPlace").item(0).getChildNodes(); //발견장소
			Node happenPlaceV = happenPlace.item(0);
			NodeList kindcd = element.getElementsByTagName("kindCd").item(0).getChildNodes(); //품종 -
			Node kindcdV = kindcd.item(0);
			NodeList color = element.getElementsByTagName("colorCd").item(0).getChildNodes(); //색상 -
			Node colorV = color.item(0);
			NodeList age = element.getElementsByTagName("age").item(0).getChildNodes(); //나이 -
			Node ageV = age.item(0);
			NodeList weight = element.getElementsByTagName("weight").item(0).getChildNodes(); //체중 -
			Node weightV = weight.item(0);
			NodeList noticeNo = element.getElementsByTagName("noticeNo").item(0).getChildNodes(); //공고번호
			Node noticeNoV = noticeNo.item(0);
			NodeList noticeSdt = element.getElementsByTagName("noticeSdt").item(0).getChildNodes(); //공고시작일
			Node noticeSdtV = noticeSdt.item(0);
			NodeList noticeEdt = element.getElementsByTagName("noticeEdt").item(0).getChildNodes(); //공고종료일
			Node noticeEdtV = noticeEdt.item(0);
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
			NodeList careNm = element.getElementsByTagName("careNm").item(0).getChildNodes(); //보호소 이름
			Node careNmV = careNm.item(0);
			NodeList careTel = element.getElementsByTagName("careTel").item(0).getChildNodes(); //보호소전화번호
			Node careTelV = careTel.item(0);
			NodeList careAddr = element.getElementsByTagName("careAddr").item(0).getChildNodes(); //보호장소
			Node careAddrV = careAddr.item(0);
			NodeList orgNm = element.getElementsByTagName("orgNm").item(0).getChildNodes(); //관할기관
			Node orgNmV = orgNm.item(0);
			NodeList officetel = element.getElementsByTagName("officetel").item(0).getChildNodes(); //담당자연락처
			Node officetelV = officetel.item(0);
	%>
	<section>
		<div id="info_container">
			<h3>유기견 상세 정보 페이지</h3>
			<div id="img">
				<img alt="" src="<%=popfileV.getNodeValue()%>">
			</div>
			<div id="dog_info">
				<div id="info">
					<p class="info_p">
						유기번호 : &nbsp;
						<%=desertionNoV.getNodeValue()%></p>
					<p class="info_p">
						접수일 : &nbsp;
						<%=happenDtV.getNodeValue()%></p>
					<p class="info_p">
						발견장소: &nbsp;
						<%=happenPlaceV.getNodeValue()%></p>
					<p class="info_p">
						품종 : &nbsp;<%=kindcdV.getNodeValue()%></p>
					<p class="info_p">
						색상 : &nbsp;<%=colorV.getNodeValue()%></p>
					<p class="info_p">
						나이 : &nbsp;<%=ageV.getNodeValue()%></p>
					<p class="info_p">
						체중 : &nbsp;<%=weightV.getNodeValue()%></p>
					<p class="info_p">
						공고번호 : &nbsp;
						<%=noticeNoV.getNodeValue()%></p>
					<p class="info_p">
						공고시작일 : &nbsp;
						<%=noticeSdtV.getNodeValue()%></p>
					<p class="info_p">
						공고종료일 : &nbsp;<%=noticeEdtV%></p>
					<p class="info_p">
						상태 : &nbsp;<%=processStateV.getNodeValue()%></p>
					<p class="info_p">
						성별 : &nbsp;<%=sexV.getNodeValue()%></p>
					<p class="info_p">
						중성화여부 : &nbsp;<%=neuterV.getNodeValue()%></p>
					<p class="info_p">
						특징 : &nbsp;<%=specialV.getNodeValue()%></p>
					<p class="info_p">
						보호소 이름 : &nbsp;<%=careNmV.getNodeValue()%></p>
					<p class="info_p">
						보호소 전화번호 : &nbsp;<%=careTelV.getNodeValue()%></p>
					<p class="info_p">
						보호장소 : &nbsp;<%=careAddrV.getNodeValue()%></p>
					<p class="info_p">
						관할기관 : &nbsp;<%=orgNmV.getNodeValue()%></p>
					<p class="info_p">
						담당자연락처 : &nbsp;<%=officetelV.getNodeValue()%></p>

				</div>
			</div>
			<div id="dog_info_button">
				<button onclick="location.href='list.do'">목록으로</button>
			</div>
		</div>
	</section>
	<%
		break;
	} else {
		System.out.println("faild_next");
		continue;
	}

	}
	conn.disconnect();
	%>
</body>
</html>