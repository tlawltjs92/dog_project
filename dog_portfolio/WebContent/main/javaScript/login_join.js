// 전체적으로 check

function checkAll() {
	var id = document.getElementById("id").value;
	if (id == "admin") {
		alert("사용할 수 없습니다.");
		location.href="login.do?contentPage=join";
		return false;
	} else if (!checkId(document.getElementById("id"))) {
		return false;
	} else if (!checkPassword(document.getElementById("id"), document
			.getElementById("password"), document.getElementById("password_ck"))) {
		return false;
	} else if (!checkName(document.getElementById("name"))) {
		return false;
	} else if (!checkBirth(document.getElementById("birth"))) {
		return false;
	} else if (!checkPhone(document.getElementById("phone"))) {
		return false;
	} else if (!checkAddress(document.getElementById("address"))) {
		return false;
	} else if (!checkEmail(document.getElementById("email"))) {
		return false;
	}
	return document.getElementById("joinform").submit();
}

// 공백확인 함수
function checkExistData(value, dataName) {
	if (value.value == "") {
		alert(dataName + " 입력해주세요!");
		value.focus();
		return false;
	}
	return true;
}

// 아이디 유효성검사
function checkId(id) {

	if (!checkExistData(id, "아이디를")) {
		return false;
	}
	var idTest = /^[a-zA-Z0-9]{4,15}$/;
	// 영문 대/소문자, 숫자만 사용가능하고, 길이는 4~15까지
	if (!idTest.test(id.value)) {
		alert("아이디는 영문 대소문자와 숫자 4~15자리로 입력해야합니다.");
		id.value = "";
		id.focus();
		return false;
	}
	return true;
}

function checkPassword(id, password, password_ck) {
	if (!checkExistData(password, "비밀번호를")) {
		return false;
	}
	if (!checkExistData(password_ck, "비밀번호 확인을")) {
		return false;
	}
	var passwordTest = /^[a-zA-Z0-9]{4,20}$/;
	if (!passwordTest.test(password.value)) {
		alert("비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다.");
		password.value = "";
		password.focus();
		return false;
	}
	// password와password_ck확인
	if (password.value != password_ck.value) {
		alert("두 비밀번호가 맞지 않습니다.");
		password_ck.value = "";
		password_ck.focus();
		return false;
	}
	// password와 id값이 같을경우
	if (id.value == password.value) {
		alert("아이디와 비밀번호가같습니다.");
		password.value = "";
		password_ck.value = "";
		password_ck.focus();
		return false;
	}
	return true;
}

function checkName(name) {
	if (!checkExistData(name, "닉네임을")) {
		return false;
	}
	var nameTest = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,15}$/;
	if (!nameTest.test(name.value)) {
		alert("닉네임이 올바르지 않습니다.");
		name.value = "";
		name.focus();
		return false;
	}
	return true;
}

function checkBirth(birth) {
	if (!checkExistData(birth, "생년월일을")) {
		return false;
	}
	var birthTest = /[0-9]{4}-(0[1-9]|1[0-2])-(0[0-3]|[1-2][0-9]|3[0-1])/;
	if (!birthTest.test(birth.value)) {
		alert("생년월일이 올바르지 않습니다.");
		birth.value = "";
		birth.focus();
		return false;
	}
	return true;
}

function checkPhone(phone) {
	if (!checkExistData(phone, "전화번호를")) {
		return false;
	}
	var phoneTest = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if (!phoneTest.test(phone.value)) {
		alert("전화번호가 올바르지 않습니다.");
		phone.value = "";
		phone.focus();
		return false;
	}
	return true;
}

function checkAddress(address) {
	if (!checkExistData(address, "주소를")) {
		return false;
	}
	var addressTest = /[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	if (!addressTest.test(address.value)) {
		alert("주소가 올바르지 않습니다.");
		address.value = "";
		address.focus();
		return false;
	}
	return true;
}

function checkEmail(email) {
	if (!checkExistData(email, "이메일 주소를")) {
		return false;
	}
	var emailTest = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	if (!emailTest.test(email.value)) {
		alert("이메일 주소가 올바르지 않습니다.");
		email.value = "";
		email.focus();
		return false;
	}
	return true;
}
