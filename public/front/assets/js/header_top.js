scroller = document.getElementById("scroller");

var myScrollFunc = function () {
    var y = window.scrollY;
    if (y >= 150) {
        scroller.className = "header_top show show-slide"
    } else {
        scroller.className = "header_top hide hide-slide"
    }
};

window.addEventListener("scroll", myScrollFunc);


