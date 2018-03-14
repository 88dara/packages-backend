package com.oyo.packagesbackend.controller;

import com.oyo.aggregation.packages.TPackageAggregationService;
import com.oyo.aggregation.packages.TPackageStandardResponse;
import com.oyo.aggregation.packages.TSearchAndFilterAttributes;
import com.oyo.metadata.*;
import com.oyo.packagesbackend.client.CmsRestApiClient;
import com.oyo.packagesbackend.config.AggregationConfig;
import com.oyo.packagesbackend.config.MetadataConfig;
import com.oyo.packagesbackend.config.ThriftClient;
import com.oyo.packagesbackend.converter.RecommendedPackageResponseToPackageRequest;
import com.oyo.packagesbackend.converter.RecommendedPackageResponseToPackageRequests;
import com.oyo.packagesbackend.model.DestinationDetails;
import com.oyo.packagesbackend.model.PackageRequest;
import com.oyo.packagesbackend.model.PackageRequests;
import com.oyo.packagesbackend.service.PackageService;
import org.apache.thrift.TException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class PackageDetailsController {

    private static final Logger logger = LoggerFactory.getLogger(PackageDetailsController.class);

    @Autowired
    CmsRestApiClient cmsRestApiClient;

    @Autowired
    MetadataConfig metadataConfig;

    @Autowired
    AggregationConfig aggregationConfig;

    @Autowired
    PackageService packageService;

    @Autowired
    RecommendedPackageResponseToPackageRequests recommendedPackageResponseToPackageRequests;

    @RequestMapping(value = "/packageDetailsOld", method = RequestMethod.GET)
    public String getPackageDetails(HttpServletRequest request, Map<String, Object> model, @RequestParam Map<String, String> requestParams) {

        logger.debug("In PackageDetails Details controller:");

//        model.put("location", requestParams.get("location"));
//        model.put("duration", requestParams.get("duration"));

        try {
            JSONParser parser = new JSONParser();
            JSONObject data = (JSONObject) parser.parse(
                    new FileReader("/Users/veera/Packages/packages-backend/src/main/resources/data/package-details.json"));
            request.getSession().setAttribute("jsonPackageDetails", data);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (org.json.simple.parser.ParseException e) {
            e.printStackTrace();
        }
        return "detailsold";
    }


    private JSONArray getOtherDestinationsToExplore(TMetaDataService.Client metadataThriftClient, String locale) {
        JSONArray result = new JSONArray();

        try {
            List<TOtherDestinationToExploreResponse> tOtherDestinationToExploreResponseList = metadataThriftClient.listOtherDestinationsToExplore(locale);
            for (TOtherDestinationToExploreResponse tOtherDestinationToExploreResponse : tOtherDestinationToExploreResponseList) {

                result.add(cmsRestApiClient.getInstances(tOtherDestinationToExploreResponse.getOtherDestination().getCatalogId()));
            }
        } catch(TException e) {
            logger.error(e.getMessage());
        }

        return result;
    }

    @RequestMapping(value = "/packageDetails/{catalogId}", method = RequestMethod.GET)
    public String showPackage(HttpServletRequest request,
                                    @PathVariable(value="catalogId") String catalogId) {

        logger.debug("In Package Display controller:");
        logger.debug(" catalogId - " + catalogId);

        String locale = "English";

        ThriftClient<TPackageAggregationService.Client> aggregationConfigCommClient = aggregationConfig.getCommClient();
        ThriftClient<TMetaDataService.Client> metadataConfigCommClient = metadataConfig.getCommClient();

        TPackageAggregationService.Client packageAggregatorThriftClient = aggregationConfigCommClient.getThriftClient();
        TMetaDataService.Client metadataThriftClient = metadataConfigCommClient.getThriftClient();

        TSearchAndFilterAttributes tSearchAndFilterAttributes = new TSearchAndFilterAttributes();

        try {
            request.getSession().setAttribute("jsonPackageDetails", packageAggregatorThriftClient.getPackageDetails(catalogId, tSearchAndFilterAttributes).getPackageDetails());
            logger.debug("Done 1");
            PackageRequests packageRequests = recommendedPackageResponseToPackageRequests.convert(metadataThriftClient.listOtherRecommendedPackages(locale));
            logger.debug("Done 2");
            request.getSession().setAttribute("jsonOtherRecommendedPackages", packageService.getPackageDetails(packageAggregatorThriftClient, packageRequests, tSearchAndFilterAttributes));
            logger.debug("Done 3");

            request.getSession().setAttribute("jsonOtherDestinationsToExplore", getOtherDestinationsToExplore(metadataThriftClient, locale));
            logger.debug("Done 4");

        } catch (TException e) {
            logger.error(e.getMessage());
        } finally {
            aggregationConfig.closeConnection(aggregationConfigCommClient);
            metadataConfig.closeConnection(metadataConfigCommClient);
        }
        return "details";
    }
}
