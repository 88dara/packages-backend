package com.oyo.packagesbackend.converter;

import com.oyo.metadata.TOtherRecommendedPackage;
import com.oyo.metadata.TOtherRecommendedPackageResponse;
import com.oyo.packagesbackend.model.PackageRequest;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RecommendedPackageResponseToPackageRequest {
//    public PackageRequest convert(TOtherRecommendedPackage tOtherRecommendedPackage) {
//        PackageRequest packageRequest = new PackageRequest();
//        packageRequest.setId(tOtherRecommendedPackage.getId());
//        packageRequest.setCatalogId(tOtherRecommendedPackage.getCatalogId());
//        return packageRequest;
//    }
//
    public List<PackageRequest> convert(List<TOtherRecommendedPackageResponse> tOtherRecommendedPackageResponseList) {
        List<PackageRequest> packageRequestList = new ArrayList<>();

        for (TOtherRecommendedPackageResponse tOtherRecommendedPackageResponse : tOtherRecommendedPackageResponseList) {
            PackageRequest packageRequest = new PackageRequest();
            TOtherRecommendedPackage tOtherRecommendedPackage = tOtherRecommendedPackageResponse.getOtherPackage();
            packageRequest.setId(tOtherRecommendedPackage.getId());
            packageRequest.setCatalogId(tOtherRecommendedPackage.getCatalogId());
            packageRequestList.add(packageRequest);
        }
        return packageRequestList;
    }
}
