package com.oyo.packagesbackend.model;

import com.google.gson.Gson;
import com.oyo.aggregation.packages.TPrice;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PackageDetailsSmall {
    String id;
    String name;
    String image_url;
    int numberOfNights;
    TPrice price;

    public PackageDetailsSmall() {
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

    public int getNumberOfNights() {
        return numberOfNights;
    }

    public void setNumberOfNights(int numberOfNights) {
        this.numberOfNights = numberOfNights;
    }

    public TPrice getPrice() {
        return price;
    }

    public void setPrice(TPrice price) {
        this.price = price;
    }

    public JSONObject toJSON() {

        Gson g = new Gson();
        String str = g.toJson(this);

        JSONParser parser = new JSONParser();
        try {
            return (JSONObject) parser.parse(str);

        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return new JSONObject();
    }
}
