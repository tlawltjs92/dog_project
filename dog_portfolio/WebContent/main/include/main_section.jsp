<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="section_div">
		<div id="section_div_r_arrow">
			<a id="a_r_arrow" onclick="img_change(2),dog_or_cat(2)"
				style="font-size: 100px">&#10095;</a>
		</div>
		<div id="section_div_l_arrow">
			<a id="a_l_arrow" onclick="img_change(1),dog_or_cat(1)"
				style="font-size: 100px">&#10094;</a>
		</div>
		<div id="section_div_a">
			<a href="list.do?kind=dog" onmouseover="find_button_on()" onmouseout="find_button_out()"
				id="a_dog">강아지 찾기</a> <a href="list.do?kind=cat" onmouseover="find_button_on()"
				onmouseout="find_button_out()" id="a_cat">고양이 찾기</a>
		</div>
		<div id="main_section_container">
			<img id="section_center_img" alt="dog" src="img/dog_img.png">
		</div>
	</div>
</body>
</html>