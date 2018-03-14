package com.oyo.packagesbackend.service;

import com.oyo.aggregation.packages.*;
import com.oyo.packagesbackend.client.CmsRestApiClient;
import com.oyo.packagesbackend.model.PackageDetails;
import com.oyo.packagesbackend.model.PackageDetailsSmall;
import com.oyo.packagesbackend.model.PackageRequest;
import com.oyo.packagesbackend.model.PackageRequests;
import org.apache.thrift.TException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PackageService {

    @Autowired
    CmsRestApiClient cmsRestApiClient;

    public PackageDetails getPackage(PackageRequest packageRequest) {
        PackageDetails packageDetails = new PackageDetails();


        return packageDetails;
    }

    public JSONArray getPackageDetails(TPackageAggregationService.Client packageAggregatorThriftClient,
                                 PackageRequests packageRequests,
                                 TSearchAndFilterAttributes tSearchAndFilterAttributes) throws TException{

        JSONArray packageDetailsList = new JSONArray();

        List<TPackageStandardResponse> tPackageStandardResponseList = packageAggregatorThriftClient.getPackageListingWithStandardDetails(packageRequests.getCatalogIds(), tSearchAndFilterAttributes);

        System.out.println(tPackageStandardResponseList);

        for (TPackageStandardResponse tPackageStandardResponse: tPackageStandardResponseList) {
            PackageDetails packageDetails = new PackageDetails();

            TPackageWithStandardDetails tPackageWithStandardDetails = tPackageStandardResponse.getPackageDetails();

            String id = tPackageWithStandardDetails.getCommonValues().getId();

            System.out.println("In response standard details - " + id + " " + tPackageWithStandardDetails.getNumberOfNights());


            JSONObject cmsResponse = cmsRestApiClient.getInstances(id);
            JSONObject cmsData = (JSONObject) cmsResponse.get("data");

            System.out.println(cmsData);


            packageDetails.setId(tPackageWithStandardDetails.getCommonValues().getId());

            packageDetails.setName((String) cmsData.get("name"));
            packageDetails.setImage_url((String) cmsData.get("image_url"));

            System.out.println(packageDetails.getName());
            System.out.println(packageDetails.getImage_url());

            packageDetails.setNumberOfNights(tPackageWithStandardDetails.getNumberOfNights());
            packageDetails.setTags(tPackageWithStandardDetails.getTags());
            packageDetails.setLegsIncluded(tPackageWithStandardDetails.getLegsIncluded());
            packageDetails.setPrice(tPackageWithStandardDetails.getCommonValues().getPrice());
            packageDetails.setInclusions(tPackageWithStandardDetails.getInclusions());

            packageDetailsList.add(packageDetails.toJSON());
        }

        return packageDetailsList;
    }

    public JSONArray getPackageSmallDetails(TPackageAggregationService.Client packageAggregatorThriftClient,
                                 PackageRequests packageRequests,
                                 TSearchAndFilterAttributes tSearchAndFilterAttributes) throws TException{

        JSONArray packageDetailsList = new JSONArray();

        List<TPackageSmallResponse> tPackageSmallResponseList = packageAggregatorThriftClient.getPackageListingWithFewDetails(packageRequests.getCatalogIds(), tSearchAndFilterAttributes);

        System.out.println(tPackageSmallResponseList);

        for (TPackageSmallResponse tPackageSmallResponse: tPackageSmallResponseList) {

            PackageDetailsSmall packageDetailsSmall = new PackageDetailsSmall();

            TPackageWithFewDetails tPackageWithFewDetails = tPackageSmallResponse.getPackageDetails();

            String id = tPackageWithFewDetails.getCommonValues().getId();


            JSONObject cmsResponse = cmsRestApiClient.getInstances(id);
            JSONObject cmsData = (JSONObject) cmsResponse.get("data");

            System.out.println(cmsData);


            packageDetailsSmall.setId(tPackageWithFewDetails.getCommonValues().getId());

            packageDetailsSmall.setName((String) cmsData.get("name"));
            packageDetailsSmall.setImage_url((String) cmsData.get("image_url"));

            packageDetailsSmall.setNumberOfNights(tPackageWithFewDetails.getNumberOfNights());

            packageDetailsSmall.setPrice(tPackageWithFewDetails.getCommonValues().getPrice());

            System.out.println(packageDetailsSmall.toJSON());
            packageDetailsList.add(packageDetailsSmall.toJSON());
        }

        System.out.println(packageDetailsList);

        return packageDetailsList;
    }

}
