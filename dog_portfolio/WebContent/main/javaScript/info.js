/**
 * 
 */
var button = true;
function button_open() {
	if (button == true) {
		var article = document.getElementById("article");
		article.style.left = "0px";
		button = false;
	} else if (button == false) {
		var article = document.getElementById("article");
		article.style.left = "-178.63px";
		button = true;
	}
}