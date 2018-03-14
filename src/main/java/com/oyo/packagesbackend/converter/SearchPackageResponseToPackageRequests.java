package com.oyo.packagesbackend.converter;

import com.oyo.packagesbackend.model.PackageRequests;
import com.oyo.search.TSearchResponse;
import org.springframework.stereotype.Repository;

@Repository
public class SearchPackageResponseToPackageRequests {

    public PackageRequests convert(TSearchResponse tSearchResponse) {
        PackageRequests packageRequests = new PackageRequests();
        packageRequests.setCatalogIds(tSearchResponse.getCatalog_ids());
        packageRequests.setIds(tSearchResponse.getCatalog_ids());

        return packageRequests;
    }
}
