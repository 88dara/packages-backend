package com.oyo.packagesbackend.controller;

import com.oyo.aggregation.packages.TPackageAggregationService;
import com.oyo.aggregation.packages.TSearchAndFilterAttributes;
import com.oyo.metadata.*;
import com.oyo.packagesbackend.client.CmsRestApiClient;
import com.oyo.packagesbackend.config.AggregationConfig;
import com.oyo.packagesbackend.config.MetadataConfig;
import com.oyo.packagesbackend.config.SearchConfig;
import com.oyo.packagesbackend.config.ThriftClient;
import com.oyo.packagesbackend.converter.HotSellingPackageResponseToPackageRequests;
import com.oyo.packagesbackend.converter.PopularPackageResponseToPackageRequests;
import com.oyo.packagesbackend.converter.RecommendedPackageResponseToPackageRequests;
import com.oyo.packagesbackend.model.PackageRequests;
import com.oyo.packagesbackend.service.PackageService;
import com.oyo.search.TSearchParameters;
import com.oyo.search.TSearchService;
import org.apache.thrift.TException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    CmsRestApiClient cmsRestApiClient;

    @Autowired
    MetadataConfig metadataConfig;

    @Autowired
    AggregationConfig aggregationConfig;

    @Autowired
    SearchConfig searchConfig;

    @Autowired
    PackageService packageService;

    @Autowired
    RecommendedPackageResponseToPackageRequests recommendedPackageResponseToPackageRequests;

    @Autowired
    PopularPackageResponseToPackageRequests popularPackageResponseToPackageRequests;

    @Autowired
    HotSellingPackageResponseToPackageRequests hotSellingPackageResponseToPackageRequests;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(HttpServletRequest request, Map<String, Object> model, @RequestParam Map<String, String> requestParams) {

        logger.debug("In Home controller:");

        String locale = "English";

        ThriftClient<TPackageAggregationService.Client> aggregationConfigCommClient = aggregationConfig.getCommClient();
        ThriftClient<TMetaDataService.Client> metadataConfigCommClient = metadataConfig.getCommClient();

        TPackageAggregationService.Client packageAggregatorThriftClient = aggregationConfigCommClient.getThriftClient();
        TMetaDataService.Client metadataThriftClient = metadataConfigCommClient.getThriftClient();

//        String catalogId = "6664";
        TSearchAndFilterAttributes tSearchAndFilterAttributes = new TSearchAndFilterAttributes();
        try {

            HttpSession httpSession = request.getSession();

            // Title with background image
            httpSession.setAttribute("titleWithBackgroundImage", cmsRestApiClient.getInstances("6001"));

            // Oyo Exclusivity
            httpSession.setAttribute("oyoExclusivity", cmsRestApiClient.getInstances("6002"));

            httpSession.setAttribute("banners", cmsRestApiClient.getInstances(Arrays.asList("6003", "6004", "6005")));

            //**** Search bar ****//
            // Destinations
//            List<TPackageDestinationResponse> tPackageDestinationResponseList = metadataThriftClient.listPackageDestination(locale);
//            JSONArray jsonDestinationsArray = new JSONArray();
//            for (TPackageDestinationResponse tPackageDestinationResponse : tPackageDestinationResponseList) {
//                jsonDestinationsArray.add(tPackageDestinationResponse.getPackageDestination());
//            }
//            httpSession.setAttribute("packageDestinations", jsonDestinationsArray);

            // Duration
//            List<TPackageDurationResponse> tPackageDurationResponseList = metadataThriftClient.listPackageDurations(locale);
//            JSONArray jsonDurationsArray = new JSONArray();
//            for (TPackageDurationResponse tPackageDurationResponse : tPackageDurationResponseList) {
//                jsonDurationsArray.add(tPackageDurationResponse.getPackageDuration());
//            }
//            httpSession.setAttribute("packageDurations", jsonDurationsArray);

            // Months
//            List<TMonthResponse> tMonthResponseList = metadataThriftClient.listMonths(locale);
//            JSONArray jsonMonthsArray = new JSONArray();
//            for (TMonthResponse tMonthResponse : tMonthResponseList) {
//                jsonMonthsArray.add(tMonthResponse.getMonth());
//            }
//            httpSession.setAttribute("packageMonths", jsonMonthsArray);


            // How it works?
            httpSession.setAttribute("howItWorks", cmsRestApiClient.getInstances(Arrays.asList("6011", "6012", "6013")));

            // Popular Packages
            PackageRequests popularPackageRequests = popularPackageResponseToPackageRequests.convert(metadataThriftClient.listPopularPackages(locale));
            httpSession.setAttribute("popularPackages", packageService.getPackageSmallDetails(packageAggregatorThriftClient, popularPackageRequests, tSearchAndFilterAttributes));

            // Hot Selling Packages
            PackageRequests hotSellingPackageRequests = hotSellingPackageResponseToPackageRequests.convert(metadataThriftClient.listHotSellingPackage(locale));
            httpSession.setAttribute("hotSellingDeals", packageService.getPackageSmallDetails(packageAggregatorThriftClient, hotSellingPackageRequests, tSearchAndFilterAttributes));

            // Travel with oyo - Blog
//            PackageRequests hotSellingPackageRequests = hotSellingPackageResponseToPackageRequests.convert(metadataThriftClient.listHotSellingPackage(locale));
//            request.getSession().setAttribute("hotSellingDeals", packageService.getPackageSmallDetails(packageAggregatorThriftClient, hotSellingPackageRequests, tSearchAndFilterAttributes));

            // Reviews
            httpSession.setAttribute("reviews", cmsRestApiClient.getInstances(Arrays.asList("6021", "6022", "6023")));




//            request.getSession().setAttribute("", tHotSellingPackagesResponseList);

        } catch (TException e) {
            logger.error(e.getMessage());
        } finally {
            aggregationConfig.closeConnection(aggregationConfigCommClient);
            metadataConfig.closeConnection(metadataConfigCommClient);
        }
        return "home";


//        JSONObject jsonObject = cmsRestApiClient.getInstances("6662");

//        model.put("message", jsonObject.get("status"));
    }

    @RequestMapping("/home")
    public String indexPage(HttpServletRequest request) throws ParseException {
        try {
            JSONParser parser = new JSONParser();
            JSONObject data = (JSONObject) parser.parse(
                    new FileReader("/Users/veera/Packages/packages-backend/src/main/resources/data/data.json"));
            request.getSession().setAttribute("jsonData", data);
            System.out.println("MAIN Image :"+data.get("main_image"));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (org.json.simple.parser.ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "home";
    }

    @RequestMapping("/test")
    public void testPage(HttpServletRequest request) throws ParseException {

        ThriftClient<TPackageAggregationService.Client> aggregationConfigCommClient = aggregationConfig.getCommClient();
        ThriftClient<TMetaDataService.Client> metadataConfigCommClient = metadataConfig.getCommClient();
        ThriftClient<TSearchService.Client> searchConfigCommClient = searchConfig.getCommClient();

        TPackageAggregationService.Client PackageAggregatorThriftClient = aggregationConfigCommClient.getThriftClient();
        TMetaDataService.Client metadataThriftClient = metadataConfigCommClient.getThriftClient();
        TSearchService.Client searchThriftClient = searchConfigCommClient.getThriftClient();

        TSearchAndFilterAttributes tSearchAndFilterAttributes = new TSearchAndFilterAttributes();

        try{
            System.out.println(PackageAggregatorThriftClient.getPackageDetails("6664", tSearchAndFilterAttributes));
            System.out.println(PackageAggregatorThriftClient.getPackageListingWithStandardDetails(Arrays.asList("9001", "9002", "9003", "9004", "9005", "9006", "9007", "9008", "9009", "9010"), tSearchAndFilterAttributes));
//            System.out.println(metadataThriftClient.getPopularPackages("1245", "en"));
            TSearchParameters tSearchParameters = new TSearchParameters();
            tSearchParameters.setDestination("kulu");
//            tSearchParameters.setDurations(durations);
//            tSearchParameters.setMonths(months);


            System.out.println(searchThriftClient.getSearchResults(tSearchParameters));
        } catch (TException e) {
        logger.error(e.getMessage());
    } finally {
        aggregationConfig.closeConnection(aggregationConfigCommClient);
        metadataConfig.closeConnection(metadataConfigCommClient);
        searchConfig.closeConnection(searchConfigCommClient);
    }

//        return "test";
    }

}
