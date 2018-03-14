package com.oyo.packagesbackend.converter;

import com.oyo.metadata.TPopularPackage;
import com.oyo.metadata.TPopularPackageResponse;
import com.oyo.packagesbackend.model.PackageRequests;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class PopularPackageResponseToPackageRequests {

    public PackageRequests convert(List<TPopularPackageResponse> tPopularPackageResponseList) {

        System.out.println(tPopularPackageResponseList);

        PackageRequests packageRequests = new PackageRequests();

        List<String> ids = new ArrayList<>();
        List<String> catalogIds = new ArrayList<>();


        for (TPopularPackageResponse tPopularPackageResponse : tPopularPackageResponseList) {
            TPopularPackage tPopularPackage = tPopularPackageResponse.getPopularPackage();
            ids.add(tPopularPackage.getId());
            catalogIds.add(tPopularPackage.getCatalogId());
        }

        packageRequests.setIds(ids);
        packageRequests.setCatalogIds(catalogIds);
        System.out.println(packageRequests);
        return packageRequests;
    }
}
