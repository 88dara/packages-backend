package com.oyo.packagesbackend.converter;

import com.oyo.metadata.THotSellingPackage;
import com.oyo.metadata.THotSellingPackageResponse;
import com.oyo.metadata.TPopularPackage;
import com.oyo.metadata.TPopularPackageResponse;
import com.oyo.packagesbackend.model.PackageRequests;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class HotSellingPackageResponseToPackageRequests {

    public PackageRequests convert(List<THotSellingPackageResponse> tHotSellingPackageResponseList) {

        System.out.println(tHotSellingPackageResponseList);

        PackageRequests packageRequests = new PackageRequests();

        List<String> ids = new ArrayList<>();
        List<String> catalogIds = new ArrayList<>();


        for (THotSellingPackageResponse tHotSellingPackageResponse : tHotSellingPackageResponseList) {
            THotSellingPackage tHotSellingPackage = tHotSellingPackageResponse.getHotSellingPacakge();
            ids.add(tHotSellingPackage.getId());
            catalogIds.add(tHotSellingPackage.getCatalogId());
        }

        packageRequests.setIds(ids);
        packageRequests.setCatalogIds(catalogIds);
        System.out.println(packageRequests);
        return packageRequests;
    }
}
