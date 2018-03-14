<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Desktop footer -->
<% String baseURL="http://www.oyorooms.com/";%>

<footer class="footer mdl-cell--hide-phone">

    <div class="mdl-grid mdl-grid--no-spacing footer__topLinksContainer">
        <div class="footer__container">
            <div class="mdl-grid mdl-grid--no-spacing">
                <div class="mdl-cell mdl-cell--2-col mdl-typography--text-uppercase footer__topLinks">
                    <a href="<%=baseURL%>/partner-with-oyo" class="mdl-typography--font-bold">Partner With Us</a>
                </div>
                <div class="mdl-cell mdl-cell--2-col mdl-typography--text-center footer__topLinks">
                    <a href="<%=baseURL%>/referral?country={{if (if-cond isMalaysia) 'malaysia' 'india'}}">Refer and Earn</a>
                </div>
                <div class="mdl-cell mdl-cell--2-col mdl-typography--text-center footer__topLinks">
                    <a href="<%=baseURL%>/business">OYO for Business</a>
                </div>
                <div class="mdl-cell mdl-cell--2-col mdl-typography--text-center footer__topLinks">
                    <a href="<%=baseURL%>/travelagent">Travel Agents</a>
                </div>
                <div class="mdl-cell mdl-cell--2-col mdl-typography--text-center footer__topLinks">
                    <a href="<%=baseURL%>/holiday-packages">Travel Packages</a>
                </div>

                <div class="mdl-cell mdl-cell--2-col mdl-typography--text-center footer__topLinks">
                    <a href="https://s3-ap-southeast-1.amazonaws.com/oyo-website/pdf/vacation-planner.pdf">Vacation Planner</a>
                </div>

            </div>
        </div>
    </div>

    <div class="footer__container">

        <div class="mdl-grid mdl-grid--no-spacing footer__topLinksContainer">
            <div class="mdl-cell mdl-cell--5-col footer__topLinks">
                <h6>Download the app</h6>
                <div class="mdl-grid mdl-grid--no-spacing">
                    <div class="mdl-cell mdl-cell--12-col">
                        <a href="https://itunes.apple.com/in/app/oyo-rooms-book-delightful/id988141624?mt=8" class="footer__downloadButton">
              <span class="footer__appIcon">
                {{inline-svg "svg/app-store-icon.svg"}}
              </span>
                            <span class="footer__appText">
                Download on the
                <span class="footer__appStoreName">App Store</span>
              </span>
                        </a>
                        <a href="https://www.microsoft.com/en-in/store/p/oyo-rooms-branded-hotels/9nblggh6hn4t" class="footer__downloadButton">
              <span class="footer__appIcon">
                {{inline-svg "svg/windows-store-icon.svg"}}
              </span>
                            <span class="footer__appText">
                Download from
                <span class="footer__appStoreName">Windows Store</span>
              </span>
                        </a>
                        <a href="https://play.google.com/store/apps/details?id=com.oyo.consumer&hl=en" class="footer__downloadButton">
              <span class="footer__appIcon">
                {{inline-svg "svg/play-store-icon.svg"}}
              </span>
                            <span class="footer__appText">
                Get it on
                <span class="footer__appStoreName">Google Play</span>
              </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="mdl-cell mdl-cell--4-col footer__topLinks">
                <div class="mdl-grid mdl-grid--no-spacing footer__secondryLinkContainer">
                    <div class="mdl-cell mdl-cell--6-col">
                        <a href="<%=baseURL%>/about?oyocorporate=">About Us</a>
                        <a href="<%=baseURL%>/team?oyocorporate=">Team / Careers</a>
                        <a href="/blog">Blog</a>
                    </div>
                    <div class="mdl-cell mdl-cell--6-col">

                        <a href="<%=baseURL%>/support/home">Support</a>

                        <a href="<%=baseURL%>/officialoyoblog">Official OYO Blog</a>
                        <a href="<%=baseURL%>/press">Press Kit</a>
                    </div>
                </div>
            </div>
            <div class="mdl-cell mdl-cell--3-col footer__topLinks">
                <div class="mdl-grid mdl-grid--no-spacing footer__secondryLinkContainer">
                    <div class="mdl-cell mdl-cell--12-col">
                        <a href="<%=baseURL%>/privacy-policy?oyocorporate=">Privacy Policy</a>
                        <a href="<%=baseURL%>/guest-policy?oyocorporate=&country={{if (if-cond isMalaysia) 'malaysia' 'india'}}">Guest Policy</a>
                        <a href="<%=baseURL%>/terms?oyocorporate=">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="mdl-grid mdl-grid--no-spacing footer__topLinksContainer mdl-typography--text-center">
            <div class="mdl-cell mdl-cell--12-col">
                <img src="assets/images/townhouse-logo.png" alt="" />
                <a href="http://www.oyotownhouse.com" class="footer__exploreButton">Explore now</a>
            </div>
        </div>

        <div class="mdl-grid mdl-grid--no-spacing footer__topLinksContainer mdl-typography--text-center">
            {{#if (if-cond  cityData.localities.length '>=' 1 ) }}
            <div class="mdl-grid mdl-grid--no-spacing footer__popularDesti">
                <h6 class="mdl-cell mdl-cell--12-col footer__popularDestiHeading">Popular destinations in {{city}}</h6>
                <div class="mdl-cell mdl-cell--12-col">
                    {{#each cityData.localities as |locality|}}
                    {{#if locality.isActive }}
                    <div class="footer__destiLinkWrapper" {{action "LocalityClick" locality.name preventDefault=false}}>
                    {{#link-to 'city' locality.slugUrl class="footer__destiLinks" }}{{locality.name}}{{/link-to}}
                </div>
                {{/if}}
                {{/each}}
            </div>
        </div>
        {{/if}}

        <div class="mdl-grid mdl-grid--no-spacing">
            <h6 class="mdl-cell mdl-cell--12-col footer__popularDestiHeading">Partner hotels</h6>
            <div class="mdl-cell mdl-cell--12-col">
                <a href="<%=baseURL%>/hotels-in-delhi/" class="footer__destiLinks">Hotels in Delhi</a>
                <a href="<%=baseURL%>/hotels-in-mumbai/" class="footer__destiLinks">Hotels in Mumbai</a>
                <a href="<%=baseURL%>/hotels-in-bangalore/" class="footer__destiLinks">Hotels in Bangalore</a>
                <a href="<%=baseURL%>/hotels-in-gurgaon/" class="footer__destiLinks">Hotels in Gurgaon</a>
                <a href="<%=baseURL%>/hotels-in-hyderabad/" class="footer__destiLinks">Hotels in Hyderabad</a>
                <a href="<%=baseURL%>/hotels-in-chennai/" class="footer__destiLinks">Hotels in Chennai</a>
                <a href="<%=baseURL%>/hotels-in-goa/" class="footer__destiLinks">Hotels in Goa</a>
                <a href="<%=baseURL%>/hotels-in-jaipur/" class="footer__destiLinks">Hotels in Jaipur</a>
                <a href="<%=baseURL%>/hotels-in-mahabaleshwar/" class="footer__destiLinks">Hotels in Mahabaleshwar</a>
                <a href="<%=baseURL%>/hotels-in-shimla/" class="footer__destiLinks">Hotels in Shimla</a>
                <a href="<%=baseURL%>/hotels-in-manali/" class="footer__destiLinks">Hotels in Manali</a>
                <a href="<%=baseURL%>/hotels-in-srinagar/" class="footer__destiLinks">Hotels in Srinagar</a>
                <a href="<%=baseURL%>/hotels-in-pune/" class="footer__destiLinks">Hotels in Pune</a>
            </div>
        </div>
    </div>

    </div>

    <div class="footer__socialPanel">
        <div class="footer__container">
            <div class="mdl-grid mdl-grid--no-spacing">
                <div class="mdl-cell mdl-cell--4-col mdl-cell--middle">
                    <a href="https://www.facebook.com/oyorooms" target="_blank" rel="nofollow" class="footer__socialMediaLink">{{inline-svg "svg/facebook.svg"}}</a>
                    <a href="https://twitter.com/oyorooms" target="_blank" rel="nofollow" class="footer__socialMediaLink">{{inline-svg "svg/twitter.svg"}}</a>
                    <a href="https://www.pinterest.com/oyorooms/" target="_blank" rel="nofollow" class="footer__socialMediaLink">{{inline-svg "svg/pinterest.svg"}}</a>
                    <a href="https://www.youtube.com/channel/UC1b6tyXZTHdIZ5vmgoAqn9w" target="_blank" rel="nofollow" class="footer__socialMediaLink">{{inline-svg "svg/youtube.svg"}}</a>
                    <a href="https://instagram.com/oyorooms/" target="_blank" rel="nofollow" class="footer__socialMediaLink">{{inline-svg "svg/instagram.svg"}}</a>
                </div>
                <div class="mdl-cell mdl-cell--4-col mdl-typography--text-center">
                    {{inline-svg "svg/oyo-logo.svg"}}
                    <span class="footer__tagLine">DELIGHTFUL  STAYS </span>
                </div>
                <div class="mdl-cell mdl-cell--4-col mdl-typography--text-right footer__copyright mdl-cell--middle">
                    2015-2016 &copy; Oravel Stays Private Limited
                </div>
            </div>
        </div>

    </div>
</footer>
