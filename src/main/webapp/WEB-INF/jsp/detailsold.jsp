<%--
  Created by IntelliJ IDEA.
  User: veera
  Date: 14/02/18
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="org.json.simple.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

    <title>Package Details</title>

    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/header.css"/>
    <link rel="stylesheet" type="text/css" href="css/footer.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<%
    JSONObject data = (JSONObject) session.getAttribute("jsonPackageDetails");
    String mainImageUrl = (String) data.get("main_image_url");
    JSONArray additionalImages = (JSONArray) data.get("additional_images");
    JSONObject packageListing = (JSONObject) data.get("package_listing");
    JSONArray itenaries = (JSONArray) data.get("itenary");
    JSONArray otherPackages = (JSONArray) data.get("other_packages");
    JSONArray bestDestinations = (JSONArray) data.get("best_destinations");
%>
]
<section class="package_details mdl-grid">
    <div class="mdl-cell mdl-cell--7-col mdl-hide-phone">
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <img src="<%=mainImageUrl%>">
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <table>
                    <tr>
                        <%
                            for (int additionalImageIndex = 0; additionalImageIndex < additionalImages.size(); additionalImageIndex++) {
                                String currentAdditionalImageUrl = (String) additionalImages.get(additionalImageIndex);
                        %>
                        <img src="<%= currentAdditionalImageUrl%>" width=10% height=20%>
                        <%}%>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="mdl-cell mdl-cell--5-col mdl-hide-phone">
        <%
            String packageName = (String) packageListing.get("package_name");
            String duration = (String) packageListing.get("duration");
            String ratings = (String) packageListing.get("ratings");
            String category_rating = (String) packageListing.get("category_rating");
            String number_of_ratings = (String) packageListing.get("number_of_ratings");
            JSONObject inclusions = (JSONObject) packageListing.get("inclusions");
            JSONArray tags = (JSONArray) packageListing.get("tags");
            String actual_price = (String) packageListing.get("actual_price");
            String deal_price = (String) packageListing.get("deal_price");
            String discount_offered = (String) packageListing.get("discount_offered");
            String fare_details = (String) packageListing.get("fare_details");
            String package_description = (String) packageListing.get("package_description");
        %>
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <h3><%= packageName %>
                </h3>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <p><%= duration %>
                </p>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <pre>
                    <%= ratings %> <%= category_rating %> <%=number_of_ratings %> ratings
                </pre>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <% if (inclusions.get("flight").equals("true")) { %> Flight <%}%>
                <% if (inclusions.get("3Star").equals("true")) { %> 3Star <%}%>
                <% if (inclusions.get("Transfer").equals("true")) { %> Transfer <%}%>
                <% if (inclusions.get("Meals").equals("true")) { %> Meals <%}%>
                <% if (inclusions.get("Sightseeing").equals("true")) { %> Sightseeing <%}%>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <p>
                    <% for (int tagIndex = 0; tagIndex < tags.size(); tagIndex++) { %>
                    <%= (String) tags.get(tagIndex) %>
                    <%}%>
                </p>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                Rs<%=deal_price %>  Rs<%= deal_price %> <%= discount_offered %>%off
                <br>
                <%= fare_details %>
            </div>
            <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--6-col mdl-hide-phone">
                        <input type="submit" value="Customize & Get Quotations">
                    </div>
                    <div class="mdl-cell mdl-cell--6-col mdl-hide-phone">
                        <input type="submit" value="Add to Shortlist">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="mdl-grid package_description">
    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <h3>Package Description</h3>
    </div>
    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <p><%= package_description %>
        </p>
    </div>
</section>

<section class="mdl-grid itinerary">
    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <h3>Itinerary</h3>
    </div>

    <%
        for (int itenaryIndex = 0; itenaryIndex < itenaries.size(); itenaryIndex++) {
            JSONObject currentItenary = (JSONObject) itenaries.get(itenaryIndex);
            String itenary_name = (String) currentItenary.get("itenary_name");
            JSONObject distance_time_tag = (JSONObject) currentItenary.get("distance_time_tag");
            String itenary_description = (String) currentItenary.get("itenary_description");
            JSONArray itenary_tags = (JSONArray) currentItenary.get("tags");
            String tour_name = (String) currentItenary.get("tour_name");
            String tour_distance = (String) currentItenary.get("tour_distance");
            String total_travel_time = (String) currentItenary.get("total_travel_time");
            JSONObject tour_tag = (JSONObject) currentItenary.get("tour_tag");
            JSONArray tour_images = (JSONArray) currentItenary.get("tour_images");
            JSONObject stay_details = (JSONObject) currentItenary.get("stay_details");
    %>

    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--1-col mdl-hide-phone">
            <h4><%=(itenaryIndex + 1) %>day</h4>
        </div>
        <div class="mdl-cell mdl-cell--11-col mdl-hide-phone">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                    <h3><%=itenary_name %>
                    </h3>
                    <% if (distance_time_tag.get("available").equals("true")) { %>
                    (<%=distance_time_tag.get("details") %>)
                    <% }%>
                </div>
                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                    <h3><%=itenary_description %>
                    </h3>
                </div>
                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                    <h5>
                        <% for (int itenaryTagIndex = 0; itenaryTagIndex < itenary_tags.size(); itenaryTagIndex++) { %>
                        <%= (String) itenary_tags.get(itenaryTagIndex) %>
                        <%} %>
                    </h5>
                </div>
                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                    Distance from <%= tour_name %>: ( <%=tour_distance %>)
                    Total time of travel : <%= total_travel_time %>
                </div>
                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                    <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                            <% if (tour_tag.get("available").equals("true")) { %>
                            <%= (String) tour_tag.get("name") %>
                            <%} %>
                        </div>
                        <% for (int imageIndex = 0; imageIndex < tour_images.size(); imageIndex++) {
                            String imageUrl = (String) tour_images.get(imageIndex);
                        %>
                        <div class="mdl-cell mdl-cell--4-col mdl-hide-phone">
                            <img src="<%=imageUrl%>" width=20% height=20%>
                        </div>
                        <% }%>

                    </div>
                </div>
                <% if (stay_details.get("available").equals("true")) {
                    String imageUrl = (String) stay_details.get("hotel_image");
                    String hotel_name = (String) stay_details.get("hotel_name");
                    String hotel_address = (String) stay_details.get("hotel_address");
                    String hotel_details = (String) stay_details.get("hotel_details");
                    JSONObject hotel_inclusions = (JSONObject) stay_details.get("hotel_inclusions");
                %>
                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                    <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                            <h4> You will be stayed in</h4>
                        </div>

                        <div class="mdl-cell mdl-cell--4-col mdl-hide-phone">
                            <img src="<%=imageUrl%>">
                        </div>
                        <div class="mdl-cell mdl-cell--8-col mdl-hide-phone">
                            <div class="mdl-grid">
                                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                                    <h4><%=hotel_name %>
                                    </h4>
                                </div>
                                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                                    <%= hotel_address %>
                                </div>
                                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                                    <%= hotel_details%>
                                </div>
                                <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
                                    <h4>
                                        <% if (hotel_inclusions.get("free_breakfast").equals("true")) {%>
                                        Breakfast
                                        <%} %>
                                        <% if (hotel_inclusions.get("AC").equals("true")) {%>
                                        AC
                                        <%} %>
                                        <% if (hotel_inclusions.get("free_WIFI").equals("true")) {%>
                                        WIFI
                                        <%} %>
                                        <% if (hotel_inclusions.get("meals").equals("true")) {%>
                                        Meals
                                        <%} %>
                                        <% if (hotel_inclusions.get("cabs").equals("true")) {%>
                                        Cab
                                        <%} %>
                                    </h4>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
    <%}%>

</section>

<section class="mdl-grid">
    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <h3> Other Recommended Packages</h3>
    </div>
    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <div class="mdl-grid">

            <% for (int packageIndex = 0; packageIndex < otherPackages.size(); packageIndex++) {
                JSONObject currentPackage = (JSONObject) otherPackages.get(packageIndex);
                String imageUrl = (String) currentPackage.get("image_url");
                String currentPackageName = (String) currentPackage.get("name");
                String currentDuration = (String) currentPackage.get("duration");
                String rating = (String) currentPackage.get("rating");
                String numberOfRatings = (String) currentPackage.get("number_of_ratings");
                String actualPrice = (String) currentPackage.get("actual_price");
                String starred = (String) currentPackage.get("starred");
                String dealPrice = (String) currentPackage.get("deal_price");
                String discountOffered = (String) currentPackage.get("discount_offered");
                String valueDeal = (String) currentPackage.get("value_deal");
                JSONArray currentTags = (JSONArray) currentPackage.get("tags");
                JSONObject currentInclusions = (JSONObject) currentPackage.get("inclusions");
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
                                        <h3><%= currentPackageName %>
                                        </h3>
                                    </div>
                                    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                        <%= currentDuration %>
                                    </div>
                                    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                        <%= rating %>(
                                        <%= numberOfRatings %> ratings)
                                    </div>
                                    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                        <% for (int tagIndex = 0; tagIndex < tags.size(); tagIndex++) {
                                            String tag = (String) tags.get(tagIndex);
                                        %>
                                        <%= tag%>
                                        <%}%>
                                    </div>
                                    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                        <% if (starred.equals("true")) {%>
                                        *
                                        <br>
                                        <%}%>
                                        <br>
                                    </div>
                                    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                                        <%= actualPrice %>
                                        (<%= discountOffered %>%off)
                                        Rs<%= dealPrice %>
                                        <% if (valueDeal.equals("true")) {%>
                                        <br> valueDeal
                                        <%} %>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mdl-cell mdl-cell--12-col mdl-cell--4-col-phone">
                        <div class="mdl-grid">
                            <h5>
                                <% if (currentInclusions.get("flight").equals("true")) {
                                %>
                                Flight
                                <%}%>
                                <% if (currentInclusions.get("3Star").equals("true")) {
                                %>
                                3Star
                                <%}%>
                                <% if (currentInclusions.get("Transfer").equals("true")) {
                                %>
                                Transfer
                                <%}%>
                                <% if (currentInclusions.get("Meals").equals("true")) {
                                %>
                                Meals
                                <%}%>
                                <% if (currentInclusions.get("Sightseeing").equals("true")) {
                                %>
                                Sightseeing
                                <%}%>
                            </h5>

                        </div>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
    </div>

    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <h3> Other Destinations to explore </h3>
        <%--<h3> Packages for best destinations in India (<%= bestDestinations.size()%>) </h3>--%>
    </div>
    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone">
        <div class="mdl-grid">
            <% for (int bestDestinationIndex = 0; bestDestinationIndex < bestDestinations.size(); bestDestinationIndex++) {
                JSONObject currentBestDestination = (JSONObject) bestDestinations.get(bestDestinationIndex);
                String name = (String) currentBestDestination.get("name");
                String no_of_packages = (String) currentBestDestination.get("no_of_packages");
                String imageUrl = (String) currentBestDestination.get("image_url");
            %>
            <div class="mdl-cell mdl-cell--3-col mdl-hide-phone column1">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone column1">
                        <img src="<%=imageUrl%>" style="width:250px;height:250px;">
                    </div>
                    <div class="mdl-cell mdl-cell--12-col mdl-hide-phone column1">
                        <h4><%=name %>
                        </h4>(<%=no_of_packages%> Packages )
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

</body>
</html>

