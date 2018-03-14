package com.oyo.packagesbackend.converter;

import com.oyo.metadata.TOtherRecommendedPackage;
import com.oyo.packagesbackend.model.PackageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RecommendedPackage {

    public PackageRequest convert(TOtherRecommendedPackage tOtherRecommendedPackage) {
            PackageRequest packageRequest = new PackageRequest();
            packageRequest.setId(tOtherRecommendedPackage.getId());
            packageRequest.setCatalogId(tOtherRecommendedPackage.getCatalogId());
        return packageRequest;
    }

    public List<PackageRequest> convert(List<TOtherRecommendedPackage> tOtherRecommendedPackageList) {
        List<PackageRequest> packageRequestList = new ArrayList<>();


        for (TOtherRecommendedPackage tOtherRecommendedPackage : tOtherRecommendedPackageList) {
            PackageRequest packageRequest = new PackageRequest();
            packageRequest.setId(tOtherRecommendedPackage.getId());
            packageRequest.setCatalogId(tOtherRecommendedPackage.getCatalogId());
            packageRequestList.add(packageRequest);
        }
        return packageRequestList;
    }
}
