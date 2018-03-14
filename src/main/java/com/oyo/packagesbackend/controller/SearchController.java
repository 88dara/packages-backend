package com.oyo.packagesbackend.controller;

import com.oyo.aggregation.packages.TPackageAggregationService;
import com.oyo.aggregation.packages.TPackageStandardResponse;
import com.oyo.aggregation.packages.TSearchAndFilterAttributes;
import com.oyo.metadata.TMetaDataService;
import com.oyo.packagesbackend.client.CmsRestApiClient;
import com.oyo.packagesbackend.config.AggregationConfig;
import com.oyo.packagesbackend.config.MetadataConfig;
import com.oyo.packagesbackend.config.SearchConfig;
import com.oyo.packagesbackend.config.ThriftClient;
import com.oyo.packagesbackend.converter.SearchPackageResponseToPackageRequests;
import com.oyo.packagesbackend.model.PackageDetails;
import com.oyo.packagesbackend.model.PackageRequests;
import com.oyo.packagesbackend.service.PackageService;
import com.oyo.search.TSearchParameters;
import com.oyo.search.TSearchResponse;
import com.oyo.search.TSearchService;
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
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Controller
public class SearchController {

    private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

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
    SearchPackageResponseToPackageRequests searchPackageResponseToPackageRequests;

    @RequestMapping(value = "/submit", method = RequestMethod.GET)
    public String submit(Map<String, Object> model, @RequestParam Map<String, String> requestParams) {

        logger.debug("In Welcome controller:");

        model.put("location", requestParams.get("location"));
        model.put("duration", requestParams.get("duration"));

        return "search";
    }

    private TSearchParameters getSearchParameters(String destination, List<String> durations, List<Integer> months) {
        TSearchParameters tSearchParameters = new TSearchParameters();
        tSearchParameters.setDestination(destination);
        tSearchParameters.setDurations(durations);
        tSearchParameters.setMonths(months);

        return tSearchParameters;
    }

    private JSONArray getCmsData(List<TPackageStandardResponse> tPackageStandardResponseList) {
        JSONArray result = new JSONArray();

        for (TPackageStandardResponse tPackageStandardResponse: tPackageStandardResponseList) {

            result.add(cmsRestApiClient.getInstances(tPackageStandardResponse.getPackageDetails().getCommonValues().getId()));
        }
        return result;
    }

//    @RequestMapping(value="/searchnew", method=RequestMethod.GET, params = { "destination", "duration", "months" })
    @RequestMapping(value="/searchnew", method=RequestMethod.GET)
    public String searchPackages(HttpServletRequest request,
                                 @RequestParam(value="destination") String destination,
                                 @RequestParam(value="duration") List<String> durations,
                                 @RequestParam(value="month") List<Integer> months)  throws ParseException {

        logger.debug("In Search controller:");
        logger.debug(" destination - " + destination);
        logger.debug(" durations - " + durations);
        logger.debug(" months - " + months);

        String locale = "English";

        ThriftClient<TPackageAggregationService.Client> aggregationConfigCommClient = aggregationConfig.getCommClient();
        ThriftClient<TSearchService.Client> searchConfigCommClient = searchConfig.getCommClient();

        TPackageAggregationService.Client packageAggregatorThriftClient = aggregationConfigCommClient.getThriftClient();
        TSearchService.Client searchThriftClient = searchConfigCommClient.getThriftClient();

        TSearchParameters tSearchParameters = getSearchParameters(destination, durations, months);

        TSearchAndFilterAttributes tSearchAndFilterAttributes = new TSearchAndFilterAttributes();


        try {
            logger.debug("Calling search service");
            PackageRequests packageRequests = searchPackageResponseToPackageRequests.convert(searchThriftClient.getSearchResults(tSearchParameters));
            logger.debug("  packageRequests: " + packageRequests.getCatalogIds());
            logger.debug("  packageRequests: " + packageRequests.getIds());

//            List<PackageDetails> packageDetailsList = packageService.getPackages(packageAggregatorThriftClient, packageRequests, tSearchAndFilterAttributes);
//            for (PackageDetails packageDetails: packageDetailsList) {
//                System.out.println(packageDetails.toString());
//            }
            request.getSession().setAttribute("jsonPackageDetailsList", packageService.getPackageDetails(packageAggregatorThriftClient, packageRequests, tSearchAndFilterAttributes));

        } catch(Exception e) {
            logger.error(e.getMessage());
        } finally {
            aggregationConfig.closeConnection(aggregationConfigCommClient);
            searchConfig.closeConnection(searchConfigCommClient);
        }

        return "search";
    }

    @RequestMapping("/search")
    public String indexPage(HttpServletRequest request) throws ParseException {
        try {
            JSONParser parser = new JSONParser();
            JSONObject data = (JSONObject) parser.parse(
                    new FileReader("/Users/veera/Packages/packages-backend/src/main/resources/data/locationData.json"));
            request.getSession().setAttribute("jsonData", data);
            System.out.println("No of packages :"+data.get("number_of_pacakges"));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (org.json.simple.parser.ParseException e) {
            e.printStackTrace();
        }
        return "search";
    }

}


