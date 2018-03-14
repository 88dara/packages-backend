package com.oyo.packagesbackend.model;

import com.google.gson.Gson;
import com.oyo.aggregation.packages.TCity;
import com.oyo.aggregation.packages.TPrice;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.util.List;

public class PackageDetails {
    String id;
    String name;
    String image_url;
    int numberOfNights;
    List<String> tags;
    List<TCity> legsIncluded;
    TPrice price;
    List<String> inclusions;

    public PackageDetails() {
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

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<TCity> getLegsIncluded() {
        return legsIncluded;
    }

    public void setLegsIncluded(List<TCity> legsIncluded) {
        this.legsIncluded = legsIncluded;
    }

    public TPrice getPrice() {
        return price;
    }

    public void setPrice(TPrice price) {
        this.price = price;
    }

    public List<String> getInclusions() {
        return inclusions;
    }

    public void setInclusions(List<String> inclusions) {
        this.inclusions = inclusions;
    }

    public JSONObject toJSON() {

//        JSONObject jo = new JSONObject();
//        jo.put("id", this.id);
//        jo.put("name", this.name);
//        jo.put("image_url", this.image_url);
//        jo.put("numberOfNights", this.numberOfNights);
//        jo.put("tags", this.tags);
//        jo.put("legsIncluded", this.legsIncluded);
//        jo.put("price", this.price);
//        jo.put("inclusions", this.inclusions);

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
