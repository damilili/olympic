<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.olympic.winter.bean.Venue" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/11/16
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>总览jsp</title>
    <link rel="stylesheet" type="text/css" href="../css/homestyle.css">
    <script type="text/javascript">
        function showPage(e, url) {
            var webframe = document.getElementById("webframe");
            var childNodes = document.getElementById("buttonlist").childNodes;
            var eid = e.id;
            if (webframe.src == url) {
                return;
            }
            console.log(url);
            webframe.src = url;
            for (var i = 0; i < childNodes.length; i++) {
                var nodeName = childNodes[i].nodeName;
                if (nodeName.toLowerCase() == 'p') {
                    var id = childNodes[i].attributes.getNamedItem("id").value;
                    console.log("id = " + id);
                    if (id == eid) {
                        childNodes[i].className = "leftButtonSelect";
                    } else {
                        childNodes[i].className = "leftButton";
                    }
                }
            }
        }

        function initIndicator() {
            var button0 = document.getElementById("replaceitemid0");
            showPage(button0, "../page/sub_sub_overview.html")
        }
        setTimeout("initIndicator()", 1);
    </script>
</head>
<body>

<div id="content" align="center">
    <div id="leftmenu">
        <div style=" overflow: hidden; border-radius: 5px;background: transparent;padding: 0;margin-top: 0;">
            <div id="contentdes" style="width:100%;height: 131px;background: #2e3655;position: relative;">
                <span style="font-size:18px;color:white;left: 0;background-color: transparent;float: left;margin-left: 20px;margin-top: 14px">工程列表</span>
                <div style="width:100%;height: 80px;background: #2b334e;margin: 50px 0 0;position: absolute">
                    <span style="font-size:13px;color:white;left: 0;background-color: transparent;float: left;margin-left: 20px;margin-top: 12px">场&nbsp &nbsp &nbsp &nbsp馆:
                        <span style="color: #50E3C2;font-size: 24px;margin-left: 5px;padding: 0">18</span>
                        <span style="font-size:12px;color:white;left: 0;background-color: transparent;margin-left: 20px;margin-top: 12px">新建</span>
                        <span style="font-size:24px;color:#83B4FF;left: 0;background-color: transparent;margin-top: 12px;margin-left: 7px">06</span>
                        <span style="font-size:12px;color:white;left: 0;background-color: transparent;margin-left: 20px;margin-top: 12px">新建</span>
                        <span style="font-size:24px;color:#83B4FF;left: 0;background-color: transparent;margin-top: 12px;margin-left: 7px">12</span>
                    </span>
                    <span style="font-size:13px;color:white;left: 0;background-color: transparent;float: left;margin-left: 20px;margin-top: 0px">配套设施:
                        <span style="color: #50E3C2;font-size: 24px;margin-left: 5px;padding: 0">14</span>
                        <span style="font-size:12px;color:white;left: 0;background-color: transparent;margin-left: 20px;margin-top: 12px">新建</span>
                        <span style="font-size:24px;color:#83B4FF;left: 0;background-color: transparent;margin-top: 12px;margin-left: 7px">06</span>
                        <span style="font-size:12px;color:white;left: 0;background-color: transparent;margin-left: 20px;margin-top: 12px">新建</span>
                        <span style="font-size:24px;color:#83B4FF;left: 0;background-color: transparent;margin-top: 12px;margin-left: 7px">08</span>
                    </span>
                </div>
            </div>
            <div id="buttonlist" class="leftmenusub">
                <%
                    String item = "    <hr align=center width=300 color=#987cb9 SIZE=1\n" +
                            "                    style=\"margin: 0;height: auto;width: 100% ;color:#75ccc2;FILTER:alpha(opacity=100,finishopacity=0,style=2);background-image: url(../image/Line4.png)\">\n" +
                            "\n" +
                            "                <p class=\"leftButton\" id=\"replaceitemid\"\n" +
                            "                   onclick=\"showPage(this,'replaceUrl')\">\n" +
                            "                    <img src=../image/changguan.png class=\"itemicon\" align=\"middle\">\n" +
                            "                    <a style=\"margin-left: 60px;\"> replacecontent </a>\n" +
                            "                </p>\n";
                %>
                <%
                    String venuesJson = (String) request.getAttribute("venues");
                    Gson gson = new Gson();
                    ArrayList<Venue> arraylist = gson.fromJson(venuesJson, new TypeToken<List<Venue>>() {
                    }.getType());
                    if (arraylist != null) {
                        for (int i = 0; i < arraylist.size(); i++) {
                            try {
                                String replaceResult = item.replace("replaceUrl", arraylist.get(i).getLink());
                                replaceResult = replaceResult.replace("replaceitemid", "replaceitemid"+i);
                                replaceResult = replaceResult.replace("replacecontent", arraylist.get(i).getName());
                                if (i == 0) {
                                    replaceResult = replaceResult.replace("leftButton", "leftButtonSelect");
                                }
                                out.print(replaceResult);
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>

                <hr align=center width=300 color=#987cb9 SIZE=1
                    style="margin: 0;height: auto;width: 100% ;color:#75ccc2;FILTER:alpha(opacity=100,finishopacity=0,style=2);background-image: url(../image/Line4.png)">

            </div>
        </div>
    </div>

    <div style="width: 83%;height: 100%;background: transparent;left: 17%;top: 0;position: absolute;visibility: visible;margin-left: 40px;overflow: hidden;border-radius: 5px">
        <iframe id="webframe" width="100%" height="100%" frameborder="no"
                src=""
                style="background-color: darkcyan;overflow: hidden;border-radius: 5px" scrolling="no">
        </iframe>
    </div>
</div>
</body>
</html>
