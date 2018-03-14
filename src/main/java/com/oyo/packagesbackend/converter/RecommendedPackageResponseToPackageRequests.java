package com.oyo.packagesbackend.converter;

import com.oyo.metadata.TOtherRecommendedPackage;
import com.oyo.metadata.TOtherRecommendedPackageResponse;
import com.oyo.packagesbackend.model.PackageRequests;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RecommendedPackageResponseToPackageRequests {

    public PackageRequests convert(List<TOtherRecommendedPackageResponse> tOtherRecommendedPackageResponseList) {

        System.out.println(tOtherRecommendedPackageResponseList);

        PackageRequests packageRequests = new PackageRequests();

        List<String> ids = new ArrayList<>();
        List<String> catalogIds = new ArrayList<>();


        for (TOtherRecommendedPackageResponse tOtherRecommendedPackageResponse : tOtherRecommendedPackageResponseList) {
            TOtherRecommendedPackage tOtherRecommendedPackage = tOtherRecommendedPackageResponse.getOtherPackage();
            ids.add(tOtherRecommendedPackage.getId());
            catalogIds.add(tOtherRecommendedPackage.getCatalogId());
        }
        packageRequests.setIds(ids);
        packageRequests.setCatalogIds(catalogIds);
        System.out.println(packageRequests);
        return packageRequests;
    }
}
