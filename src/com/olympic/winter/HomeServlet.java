package com.olympic.winter;

import com.google.gson.Gson;
import com.olympic.winter.bean.Venue;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameterMap().containsKey("subpage")) {
            String subpage = request.getParameter("subpage");
            ArrayList<Venue> venues = new ArrayList();
            String[] vName = {"国家速滑馆", "国家高山滑雪中心", "北京冬奥村", "国家雪车雪橇中心", "延庆冬奥村", "冬季运动管理中心综合训练馆"};
            String[] vUrl = {
                    "../page/sub_sub_overview.html",
                    "https://baike.baidu.com/item/%E5%9B%BD%E5%AE%B6%E9%AB%98%E5%B1%B1%E6%BB%91%E9%9B%AA%E4%B8%AD%E5%BF%83",
                    "https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC%E5%86%AC%E5%A5%A5%E6%9D%91",
                    "https://baike.baidu.com/item/%E5%9B%BD%E5%AE%B6%E9%9B%AA%E8%BD%A6%E9%9B%AA%E6%A9%87%E4%B8%AD%E5%BF%83",
                    "https://baike.baidu.com/item/%E5%BB%B6%E5%BA%86%E5%86%AC%E5%A5%A5%E6%9D%91/22746366?fr=aladdin",
                    "http://www.86gc.net/article/html/39743.html"
            };
            for (int i = 0; i < vName.length; i++) {
                Venue venue = new Venue();
                venue.setName(vName[i]);
                venue.setLink(vUrl[i]);
                venues.add(venue);
            }
            Gson gson = new Gson();
            String venueJson = gson.toJson(venues);
            request.setAttribute("venues", venueJson);
            String s = String.format("/jsp/%s.jsp", subpage);
            request.getRequestDispatcher(s).forward(request, response);
        }
        request.getRequestDispatcher("/page/home.html").forward(request, response);

    }
}
