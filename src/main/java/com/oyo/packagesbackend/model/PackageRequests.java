package com.oyo.packagesbackend.model;

import java.util.List;

public class PackageRequests {
    List<String> ids;
    List<String> catalogIds;

    public List<String> getIds() {
        return ids;
    }

    public void setIds(List<String> ids) {
        this.ids = ids;
    }

    public List<String> getCatalogIds() {
        return catalogIds;
    }

    public void setCatalogIds(List<String> catalogIds) {
        this.catalogIds = catalogIds;
    }
}
