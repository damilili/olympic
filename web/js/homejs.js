maxtime = 24 * 60 * 60 * 125; //一个小时，按秒计算，自己调整!
function CountDown() {
    if (maxtime >= 0) {
        days = Math.floor(maxtime / (24 * 60 * 60));
        hours = Math.floor(maxtime % (24 * 60 * 60) / (60 * 60));
        minutes = Math.floor(maxtime % (24 * 60 * 60) % (60 * 60) / 60);
        seconds = Math.floor(maxtime % (24 * 60 * 60) % (60 * 60) % 60);
        document.all["day"].innerHTML = days;
        document.all["hour"].innerHTML = hours == 0 ? "00" : hours;
        document.all["min"].innerHTML = minutes == 0 ? "00" : minutes;
        document.all["second"].innerHTML = seconds == 0 ? "00" : seconds;
        if (maxtime == 5 * 60) alert("还剩5分钟");
        --maxtime;
    } else {
        clearInterval(timer);
        alert("时间到，结束!");
    }
}

timer = setInterval("CountDown()", 1000);

function switchPage(e, url) {
    console.log("--------------------------  "+url);
    var mainframe = document.getElementById("mainframe");
    var indicator = document.getElementById("indicator");
    mainframe.src = url;
    var childNodes = document.getElementById("mainMenu").childNodes;
    console.log(childNodes.length + "===len")
    for (var i = 0; i < childNodes.length; i++) {
        var nodeName = childNodes[i].nodeName;
        console.log(nodeName + "===nodeName")
        if (nodeName.toLowerCase() == 'a') {
            var id = childNodes[i].attributes.getNamedItem("id").value;
            console.log("id = " + id);
            console.log("e.id = " + e.id);
            if (id == e.id) {
                childNodes[i].className = "ksselected";
                console.log("childNodes[i].margin = " + e.offsetWidth);
                indicator.style.left = (e.offsetLeft + e.offsetWidth / 2 - 5) + "px"
                indicator.style.top = (e.offsetTop + e.offsetHeight - 3) + "px"
            } else {
                childNodes[i].className = "ks";
            }
        }
    }
}

function initIndicator() {
    var button0 = document.getElementById("button0");
    switchPage(button0, "../home?subpage=overview")
}

setTimeout("initIndicator()", 1);

