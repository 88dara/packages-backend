package com.oyo.packagesbackend.model;

public class DestinationDetails {
    String id;
    String name;
    String image_url;
    int no_of_packages;

    public DestinationDetails() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getNo_of_packages() {
        return no_of_packages;
    }

    public void setNo_of_packages(int no_of_packages) {
        this.no_of_packages = no_of_packages;
    }
}
