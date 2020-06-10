window.onload = function() {
	var cat_name = document.getElementById("a_cat");
	var dog_name = document.getElementById("a_dog");
	cat_name.style.display = "none";
	dog_name.style.display = "block";
}

function find_button_on() {
	var name = document.getElementById("main_section_container");
	name.style.filter = "brightness(50%)";
}
function find_button_out() {
	var name = document.getElementById("main_section_container");
	name.style.filter = "brightness(100%)";
}

function img_change(num) {
	if (num == 1) {
		var img = document.getElementById("section_center_img");
		img.src = "img/dog_img.png";
	} else if (num == 2) {
		var img = document.getElementById("section_center_img");
		img.src = "img/cat_img2.jpg";
	}
}

function dog_or_cat(num) {
	if (num == 1) {
		var cat_name = document.getElementById("a_cat");
		var dog_name = document.getElementById("a_dog");
		cat_name.style.display = "none";
		dog_name.style.display = "block";
	} else if (num == 2) {
		var cat_name = document.getElementById("a_cat");
		var dog_name = document.getElementById("a_dog");
		cat_name.style.display = "block";
		dog_name.style.display = "none";
	}
}
