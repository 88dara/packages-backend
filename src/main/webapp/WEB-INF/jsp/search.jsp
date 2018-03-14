<%@ page contentType="text/html;charset=UTF-8" language="java" import="org.json.simple.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oyo.aggregation.packages.TCity" %>
<%@ page import="com.oyo.aggregation.packages.TPrice" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

    <title>Oyo Packages</title>

    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/header.css"/>
    <link rel="stylesheet" type="text/css" href="css/footer.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<%--<%--%>
<%--JSONObject data = (JSONObject) session.getAttribute("jsonData");--%>
<%--String name = (String) data.get("name");--%>
<%--String noOfPackages = (String) data.get("number_of_pacakges");--%>
<%--String description = (String) data.get("description");--%>
<%--JSONArray cityTags = (JSONArray) data.get("city_tags");--%>
<%--JSONArray categories = (JSONArray) data.get("categories");--%>
<%--JSONArray priceRanges = (JSONArray) data.get("price_ranges");--%>
<%--JSONArray dayRanges = (JSONArray) data.get("day_ranges");--%>
<%--%>--%>

<%--<!--  Image at top -->--%>
<%--<div class="mdl-grid">--%>
<%--<div class="mdl-cell mdl-cell--12-col mdl-hide-phone">--%>
<%--<div style="background-image: url(https://rajatch.files.wordpress.com/2015/03/wp_20141228_036-copy.jpg?w=1200);--%>
<%--height: 400px; width: 1435px; border: 1px solid black;">--%>
<%--</div>--%>
<%--</div>--%>
<%--<div>--%>
<%--<center><h1> All Packages for <%=name%>--%>
<%--</h1></center>--%>
<%--<center><h4><%=noOfPackages %>PACKAGES FOUND </h4></center>--%>
<%--<p><%= description %>--%>
<%--</p>--%>
<%--<% for (int tagIndex = 0; tagIndex < cityTags.size(); tagIndex++) {--%>
<%--String currentCity = (String) cityTags.get(tagIndex);--%>
<%--%>--%>
<%--<a href="/location"><%= currentCity%>--%>
<%--</a>--%>
<%--<%}%>--%>

<%--</div>--%>

<%--</div>--%>

<%--&lt;%&ndash;<!--  TYPE/CATEGORY -->&ndash;%&gt;--%>
<%--<div class="mdl-grid">--%>
<%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
<%--<h3> Type/Category</h3>--%>
<%--</div>--%>

<%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
<%--<div class="mdl-grid">--%>
<%--<% for (int CategoryIndex = 0; CategoryIndex < categories.size(); CategoryIndex++) {--%>
<%--JSONObject currentCategory = (JSONObject) categories.get(CategoryIndex);--%>
<%--String imageUrl = (String) currentCategory.get("image_url");--%>
<%--%>--%>
<%--<div class="mdl-cell mdl-cell--3-col mdl-cell--2-col-phone" style="background-image: url(<%=imageUrl %>);--%>
<%--float: left;  width: 17%;   padding: 10px;  height: 100px; border: 1px solid black;">--%>
<%--<h3><%= currentCategory.get("name") %>--%>
<%--</h3>--%>
<%--Starting from <%=currentCategory.get("starting_price")%>--%>
<%--<br>--%>
<%--<%= currentCategory.get("number_of_packages") %> Packages--%>
<%--</div>--%>
<%--<%}%>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="mdl-cell mdl-cell--8-col mdl-cell--4-col-phone">--%>
<%--<div class="mdl-grid">--%>
<%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
<%--<h3>Price range</h3>--%>
<%--</div>--%>
<%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
<%--<form>--%>
<%--<% for (int temp = 0; temp < priceRanges.size(); temp++) {--%>
<%--JSONObject currentPriceRange = (JSONObject) priceRanges.get(temp);--%>
<%--%>--%>
<%--<input type="radio" name="price-range" value="price-range">--%>
<%--<%=currentPriceRange.get("starting_price")%>-<%= currentPriceRange.get("ending_price")%>--%>
<%--<% } %>--%>
<%--</form>--%>
<%--</div>--%>

<%--</div>--%>
<%--</div>--%>

<%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
<%--<div class="mdl-grid">--%>
<%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
<%--<h3>Days</h3>--%>
<%--</div>--%>
<%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
<%--<form>--%>
<%--<% for (int temp = 0; temp < dayRanges.size(); temp++) {--%>
<%--String currentDayRange = (String) dayRanges.get(temp);--%>
<%--%>--%>
<%--<input type="radio" name="price-range" value="price-range"> <%=currentDayRange%>--%>
<%--<%} %>--%>
<%--</form>--%>
<%--</div>--%>

<%--</div>--%>
<%--</div>--%>

<%--</div>--%>

<%--<!--  PACKAGES -->--%>
<div class="mdl-grid">

    <%
        JSONArray packageListing = (JSONArray) session.getAttribute("jsonPackageDetailsList");

        for (int packageIndex = 0; packageIndex < packageListing.size(); packageIndex++) {
            JSONObject currentPackage = (JSONObject) packageListing.get(packageIndex);

            String id = (String) currentPackage.get("id");
            String packageName = (String) currentPackage.get("name");
            String imageUrl = (String) currentPackage.get("image_url");

            long numberOfNights = (long) currentPackage.get("numberOfNights");
            String duration = "" + (numberOfNights + 1) + "D, " + numberOfNights + "N";

            JSONArray tags = (JSONArray) currentPackage.get("tags");
            JSONArray legsIncluded = (JSONArray) currentPackage.get("legsIncluded");
            JSONObject price = (JSONObject) currentPackage.get("price");
            double originalPrice = (double) price.get("originalPrice");
            boolean valueDeal = (boolean) price.get("valueDeal");
            double afterDiscountPrice = (double) price.get("afterDiscountPrice");
            double discountPercentage = (double) price.get("discountPercentage");

            JSONArray inclusions = (JSONArray) currentPackage.get("inclusions");
    %>
    <div class="mdl-cell mdl-cell--6-col mdl-cell--4-col-phone">
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--6-col mdl-cell--4-col-phone">
                        <img src="<%=imageUrl%>" height="200" width="200">
                    </div>
                    <div class="mdl-cell mdl-cell--6-col mdl-cell--4-col-phone">
                        <div class="mdl-grid">
                            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                <h3><%= packageName %>
                                </h3>
                            </div>
                            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                <%= duration %>
                            </div>
                            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                <% for (int tagIndex = 0; tagIndex < tags.size(); tagIndex++) {
                                    String tag = (String) tags.get(tagIndex);
                                %>
                                <%= tag%>
                                <%}%>
                            </div>
                            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                <h3>Cities:</h3>
                                <% for (int legsIndex = 0; legsIndex < legsIncluded.size(); legsIndex++) {
                                    JSONObject leg = (JSONObject) legsIncluded.get(legsIndex);
                                    String legName = (String) leg.get("name");
                                %>
                                <%= legName %>
                                <%}%>
                            </div>
                            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                <% if (valueDeal) {%>
                                Value Deal !
                                <%}%>
                            </div>
                            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                <%= afterDiscountPrice %>
                                (<%= originalPrice %>%off)
                                Rs<%= discountPercentage %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                <% for (int index = 0; index < inclusions.size(); index++) {
                    String inclusion = (String) inclusions.get(index);
                %>
                <%= inclusion%>
                <%}%>

            </div>
        </div>
    </div>
    <%} %>
</div>
<div class="mdl-grid">
    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
        <input type="submit" name="load-more" value="load-more">
    </div>
</div>
</body>
</html>
