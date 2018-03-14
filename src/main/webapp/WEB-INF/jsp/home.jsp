<%@ page contentType="text/html;charset=UTF-8" language="java" import="org.json.simple.*" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
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

<%--<jsp:include page="header.jsp"/>--%>
<%
    JSONObject cms_data =  (JSONObject)session.getAttribute("titleWithBackgroundImage");
    JSONObject data = (JSONObject) cms_data.get("data");
    String title = (String) data.get("title");
    String subtitle = (String) data.get("subtitle");
    String image = (String) data.get("image");

    cms_data =  (JSONObject)session.getAttribute("oyoExclusivity");
    data = (JSONObject) cms_data.get("data");
    String title1 = (String) data.get("title1");
    String title2 = (String) data.get("title2");
    String subtitle2 = (String) data.get("subtitle");

    JSONArray cms_data_array =  (JSONArray) session.getAttribute("banners");
%>

<div class="mdl-grid" style="margin-top:100px">
    <div class="mdl-cell mdl-cell--6-col mdl-hide-phone">
        <img width="100%" height="100%" src="<%=image%>">
        <h1><%= title%></h1>
        <h2><%= subtitle%></h2>
    </div>
    <div class="mdl-cell mdl-cell--6-col mdl-hide-phone">
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <%= title1 + " " + title2 %>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <%= subtitle2%>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <div class="mdl-grid">
                    <% for (int index = 0; index < cms_data_array.size(); index++) {
                        cms_data = (JSONObject)cms_data_array.get(index);
                        cms_data = (JSONObject)cms_data.get("data");
                        title =  (String)cms_data.get("title");
                        image =  (String)cms_data.get("image");
                        subtitle =  (String)cms_data.get("subtitle");
                    %>
                        <div class="mdl-cell mdl-cell--4-col mdl-hide-phone">
                            <img width="100%" height="100%" src="<%=image%>">
                            <%= title%>
                            <%= subtitle%>
                        </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<form action="/search">--%>
<%
    JSONArray destinations =  (JSONArray) session.getAttribute("packageDestinations");
    JSONArray durations =  (JSONArray)session.getAttribute("packageDurations");
    JSONArray months =  (JSONArray)session.getAttribute("packageMonths");
    int flag = 0;
%>
    <div class="mdl-grid">
        <%--<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-phone button">--%>
            <%--<select name="destination" style=".button:hover{color:#ffffff},">--%>
            <%--</select>--%>
        <%--</div>--%>
        <%--<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-phone">--%>
            <%--<input type="text" name="destination" placeholder="Enter Destination">--%>
            <%--<% for (int index = 0; index < destinations.size(); index++) {--%>
                <%--JSONObject jsonObject = (JSONObject)destinations.get(index);--%>
                <%--%>--%>
            <%--<option value="<%=(String)jsonObject.get("name") %>"><%=(String) jsonObject.get("name") %>--%>
            <%--</option>--%>
            <%--<%}%>--%>
        <%--</div>--%>
        <%--<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-phone">--%>
            <%--<% for (int index = 0; index < durations.size(); index++) {--%>
                <%--JSONObject jsonObject = (JSONObject)durations.get(index);--%>
            <%--%>--%>
            <%--<option value="<%=(String)jsonObject.get("name") %>"><%=(String) jsonObject.get("name") %>--%>
            <%--</option>--%>
            <%--<%}%>--%>
            <%--&lt;%&ndash;<input type="text" name="duration" placeholder="Select Duration">&ndash;%&gt;--%>
        <%--</div>--%>
        <%--<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-phone">--%>
            <%--<% for (int index = 0; index < months.size(); index++) {--%>
                <%--JSONObject jsonObject = (JSONObject)months.get(index);--%>
            <%--%>--%>
            <%--<option value="<%=(String)jsonObject.get("name") %>"><%=(String) jsonObject.get("name") %>--%>
            <%--</option>--%>
            <%--<%}%>--%>
            <%--&lt;%&ndash;<input type="text" name="month" placeholder="Select Month">&ndash;%&gt;--%>
        <%--</div>--%>
        <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-phone">
            <input type="submit" value="SEARCH PACKAGES">
        </div>
    </div>
</form>

<!--  How it works -->
<%
    cms_data_array =  (JSONArray) session.getAttribute("howItWorks");
%>
<div class="mdl-grid row1">
    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
        <h3> How it works? </h3>
    </div>
    <% for (int index = 0; index < cms_data_array.size(); index++) {
        cms_data = (JSONObject)cms_data_array.get(index);
        cms_data = (JSONObject)cms_data.get("data");
        title =  (String)cms_data.get("title");
        String description =  (String)cms_data.get("description");
    %>
    <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">
                <%= index%>
            </div>
            <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                        <%= title%>
                    </div>
                    <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                        <%= description%>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%}%>
</div>

<!--  Our Popular Packages-->
<%
    cms_data_array =  (JSONArray) session.getAttribute("popularPackages");
%>
<div class="mdl-grid row1">
    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
        <h3>Our Popular Packages</h3>
    </div>
    <% for (int index = 0; index < cms_data_array.size(); index++) {
        cms_data = (JSONObject)cms_data_array.get(index);
        String name =  (String)cms_data.get("name");
        String image_url =  (String)cms_data.get("image_url");
        long numberOfNights =  (long)cms_data.get("numberOfNights");
        JSONObject price = (JSONObject) cms_data.get("price");
        double afterDiscountPrice = (double) price.get("afterDiscountPrice");

    %>
    <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                <img src="<%=image_url%>">
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                        <%= name%>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">
                        <%= afterDiscountPrice%>
                    </div>
                    <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                        <%= (numberOfNights+1)+"Days & " + numberOfNights + "Nights"%>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">
                        Starting Price
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%}%>
</div>

<!--  Hot Selling Deals -->
<%
    cms_data_array =  (JSONArray) session.getAttribute("hotSellingDeals");
%>
<div class="mdl-grid row1">
    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
        <h3>Hot Selling Deals</h3>
    </div>
    <% for (int index = 0; index < cms_data_array.size(); index++) {
        cms_data = (JSONObject)cms_data_array.get(index);
        String name =  (String)cms_data.get("name");
        String image_url =  (String)cms_data.get("image_url");
        long numberOfNights =  (long)cms_data.get("numberOfNights");
        JSONObject price = (JSONObject) cms_data.get("price");
        double afterDiscountPrice = (double) price.get("afterDiscountPrice");
        double originalPrice = (double) price.get("originalPrice");
        double discountPercentage = (double) price.get("discountPercentage");

    %>
    <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                <img src="<%=image_url%>">
                <%= discountPercentage %>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                        <%= name%>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">
                        <%= afterDiscountPrice%>
                    </div>
                    <div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">
                        <%= (numberOfNights+1)+"Days & " + numberOfNights + "Nights"%>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">
                        <%= originalPrice%>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%}%>
</div>

<!--  Travel with OYO -->
<%--<%--%>
    <%--cms_data_array =  (JSONArray) session.getAttribute("hotSellingDeals");--%>
<%--%>--%>
<%--<div class="mdl-grid row1">--%>
    <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
        <%--<h3>Our Popular Packages</h3>--%>
    <%--</div>--%>
    <%--<% for (int index = 0; index < cms_data_array.size(); index++) {--%>
        <%--cms_data = (JSONObject)cms_data_array.get(index);--%>
        <%--cms_data = (JSONObject)cms_data.get("data");--%>
        <%--String name =  (String)cms_data.get("name");--%>
        <%--String image_url =  (String)cms_data.get("image_url");--%>
        <%--int numberOfNights =  (int)cms_data.get("numberOfNights");--%>
        <%--JSONObject price = (JSONObject) cms_data.get("price");--%>
        <%--double afterDiscountPrice = (double) price.get("afterDiscountPrice");--%>
        <%--double originalPrice = (double) price.get("originalPrice");--%>
        <%--double discountPercentage = (double) price.get("discountPercentage");--%>

    <%--%>--%>
    <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
        <%--<div class="mdl-grid">--%>
            <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
                <%--<img src="<%=image_url%>">--%>
                <%--<%= discountPercentage %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
                <%--<div class="mdl-grid">--%>
                    <%--<div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">--%>
                        <%--<%= name%>--%>
                    <%--</div>--%>
                    <%--<div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">--%>
                        <%--<%= afterDiscountPrice%>--%>
                    <%--</div>--%>
                    <%--<div class="mdl-cell mdl-cell--10-col mdl-cell--4-col-phone">--%>
                        <%--<%= (numberOfNights+1)+"Days & " + numberOfNights + "Nights"%>--%>
                    <%--</div>--%>
                    <%--<div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-phone">--%>
                        <%--<%= originalPrice%>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

        <%--</div>--%>
    <%--</div>--%>
    <%--<%}%>--%>
<%--</div>--%>

<%--<!--  Travel with OYO -->--%>
<%--<div class="mdl-grid row1">--%>
    <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
        <%--<h3> Travel wti </h3>--%>
    <%--</div>--%>
    <%--<div class="mdl-grid">--%>
        <%--<% for(int bestDestinationIndex=0 ; bestDestinationIndex< bestDestinations.size() ; bestDestinationIndex++ ){--%>
            <%--JSONObject currentBestDestination = (JSONObject)bestDestinations.get(bestDestinationIndex);--%>
            <%--String name= (String)currentBestDestination.get("name");--%>
            <%--double startingPrice=  Double.parseDouble( (String)currentBestDestination.get("starting_price") );--%>
            <%--String imageUrl = (String)currentBestDestination.get("image_url");--%>
        <%--%>--%>
        <%--<div class="mdl-cell mdl-cell--3-col mdl-cell--2-col-phone column1">--%>
            <%--<img src="<%=imageUrl%>" style="width:250px;height:250px;">--%>
            <%--<h4><%=name %> Starting at Rs <%=startingPrice%> </h4>--%>
        <%--</div>--%>
        <%--<%}%>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<!--Collections  -->--%>
<%--<div class="mdl-grid row2">--%>
    <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
        <%--<h3> Collections( <%= collections.size() %>)</h3>--%>
    <%--</div>--%>
    <%--<div class="mdl-grid">--%>
        <%--<% for(int collectionIndex=0 ; collectionIndex< collections.size() ; collectionIndex++ ){--%>
            <%--JSONObject currentCollection = (JSONObject)collections.get(collectionIndex);--%>
            <%--String name= (String)currentCollection.get("name");--%>
            <%--String noOfPackages=   ((String)currentCollection.get("number_of_packages")) ;--%>
            <%--String imageUrl = (String)currentCollection.get("image_url");--%>
        <%--%>--%>
        <%--<div class="mdl-cell mdl-cell--3-col mdl-cell--2-col-phone column2">--%>
            <%--<img src="<%=imageUrl%>" style="width:250px;height:250px;">--%>
            <%--<h4><%=name %></h4>--%>
            <%--No of Packages:<%=noOfPackages%>--%>
        <%--</div>--%>
        <%--<%}%>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<!-- Reviews -->--%>
<%
    cms_data_array =  (JSONArray) session.getAttribute("reviews");
%>

<div class="mdl-grid">
    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
        <h2>We keep writing blogs.</h2>
    </div>
    <div class="mdl-grid">
        <% for(int index=0 ; index< cms_data_array.size() ; index++ ){
            JSONObject currentReview = (JSONObject)cms_data_array.get(index);
            cms_data = (JSONObject)currentReview.get("data");
            title= (String)cms_data.get("title");
            String description=   (String)cms_data.get("description");
        %>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone column1">
            <h4><%=title %></h4>
            <%=description %>
            <%=title %>
        </div>
        <%}%>
    </div>
</div>

<%--&lt;%&ndash;<!-- STORIES -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<br><br><br><br><br><br>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>Stories from those who love us.</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="row1">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<% for(int storyIndex=0 ; storyIndex< stories.size() ; storyIndex++ ){&ndash;%&gt;--%>
        <%--&lt;%&ndash;JSONObject currentStory = (JSONObject)stories.get(storyIndex);&ndash;%&gt;--%>
        <%--&lt;%&ndash;String description= (String)currentStory.get("description");&ndash;%&gt;--%>
        <%--&lt;%&ndash;String userName=   ((String)currentStory.get("user_name")) ;&ndash;%&gt;--%>
        <%--&lt;%&ndash;String city=   ((String)currentStory.get("city")) ;&ndash;%&gt;--%>
    <%--&lt;%&ndash;%>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<div class="column1">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<%=description%>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<br>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<h4><%=userName %>(<%=city %>)</h4>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<%}%>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

<%--<div class="mdl-grid">--%>

    <%--<%--%>
        <%--JSONArray packagesList = (JSONArray) session.getAttribute("popularPackages");--%>
    <%--%>--%>

    <%--<div class="mdl-cell mdl-cell--12-col mdl-hide-phone">--%>
        <%--<h3> Our Popular Packages </h3>--%>
    <%--</div>--%>

    <%--<%--%>
        <%--for (int packageIndex = 0; packageIndex < packagesList.size(); packageIndex++) {--%>
            <%--JSONObject currentPackage = (JSONObject) packagesList.get(packageIndex);--%>

            <%--String id = (String) currentPackage.get("id");--%>
            <%--String name = (String) currentPackage.get("name");--%>
            <%--String imageUrl = (String) currentPackage.get("image_url");--%>

            <%--long numberOfNights = (long) currentPackage.get("numberOfNights");--%>
            <%--String duration = "" + (numberOfNights+1) + "D, " + numberOfNights + "N";--%>

            <%--JSONObject price = (JSONObject) currentPackage.get("price");--%>
            <%--double originalPrice = (double) price.get("originalPrice");--%>
            <%--boolean valueDeal = (boolean) price.get("valueDeal");--%>
            <%--double afterDiscountPrice = (double) price.get("afterDiscountPrice");--%>
            <%--double discountPercentage = (double) price.get("discountPercentage");--%>
    <%--%>--%>
    <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
        <%--<div class="mdl-grid">--%>
            <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
                <%--<img src="<%=imageUrl%>" height="200" width="200">--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--8-col mdl-cell--4-col-phone">--%>
                <%--<%= name %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
                <%--<%= afterDiscountPrice %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--8-col mdl-cell--4-col-phone">--%>
                <%--<%= duration %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
                <%--Starting price--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<%} %>--%>
<%--</div>--%>

<%--<div class="mdl-grid">--%>

    <%--<%--%>
        <%--JSONArray hotSellingPackagesList = (JSONArray) session.getAttribute("popularPackages");--%>
    <%--%>--%>

    <%--<div class="mdl-cell mdl-cell--12-col mdl-hide-phone">--%>
        <%--<h3> Hot Selling Deals </h3>--%>
    <%--</div>--%>

    <%--<%--%>
        <%--for (int packageIndex = 0; packageIndex < hotSellingPackagesList.size(); packageIndex++) {--%>
            <%--JSONObject currentPackage = (JSONObject) hotSellingPackagesList.get(packageIndex);--%>

            <%--String id = (String) currentPackage.get("id");--%>
            <%--String name = (String) currentPackage.get("name");--%>
            <%--String imageUrl = (String) currentPackage.get("image_url");--%>

            <%--long numberOfNights = (long) currentPackage.get("numberOfNights");--%>
            <%--String duration = "" + (numberOfNights+1) + "D, " + numberOfNights + "N";--%>

            <%--JSONObject price = (JSONObject) currentPackage.get("price");--%>
            <%--double originalPrice = (double) price.get("originalPrice");--%>
            <%--boolean valueDeal = (boolean) price.get("valueDeal");--%>
            <%--double afterDiscountPrice = (double) price.get("afterDiscountPrice");--%>
            <%--double discountPercentage = (double) price.get("discountPercentage");--%>
    <%--%>--%>
    <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
        <%--<div class="mdl-grid">--%>
            <%--<div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">--%>
                <%--<img src="<%=imageUrl%>" height="200" width="200">--%>
                <%--<%= discountPercentage %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--8-col mdl-cell--4-col-phone">--%>
                <%--<%= name %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
                <%--<%= afterDiscountPrice %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--8-col mdl-cell--4-col-phone">--%>
                <%--<%= duration %>--%>
            <%--</div>--%>
            <%--<div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-phone">--%>
                <%--<%= originalPrice %>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<%} %>--%>
<%--</div>--%>

<%--<jsp:include page="footer.jsp" />--%>
</body>
</html>