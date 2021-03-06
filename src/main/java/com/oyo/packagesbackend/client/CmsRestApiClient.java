package com.oyo.packagesbackend.client;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

@Component
public class CmsRestApiClient {

    private static final Logger logger = LoggerFactory.getLogger(CmsRestApiClient.class);

    @Value("${cms.instance.url}")
    private String cmsUrl;

    private JSONObject getErrorJsonObject() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "failure");
        return jsonObject;
    }

    public JSONObject getInstances(String cmsId) {


        try {

            URL url = new URL(cmsUrl+cmsId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("GET");

            conn.setRequestProperty("Accept", "application/json");

            logger.debug("Cms Service: get - " + cmsId);

            conn.setRequestProperty("cache-control", "no-cache");

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("Failed : HTTP error code : "
                        + conn.getResponseCode());
            }

            InputStreamReader inputStreamReader = new InputStreamReader((conn.getInputStream()));
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(inputStreamReader);

//            System.out.println("response from CMS: " + jsonObject.toJSONString());

            conn.disconnect();
            return  jsonObject;
        } catch (Exception e) {
            System.out.println("Error SMS " + e);
            return getErrorJsonObject();
        }
//        } catch (MalformedURLException e) {
//            System.out.println("Error SMS " + e);
//        } catch (IOException e) {
//            System.out.println("Error SMS " + e);
//        }
//        catch (ParseException e) {
//            System.out.println("Error SMS " + e);
////            return "Error " + e;
//        }



//        List<PackageDetails> packageList = client.getPackageListingWithMediumDetails(Arrays.asList(1,2,43,4));
//        TSerializer serializer = new TSerializer(new TSimpleJSONProtocol.Factory());
//        String packageDetailsJson = serializer.toString(pacakgeResponse);
//
//        System.out.println(packageDetailsJson);
//        JSONObject jsonObject = new JSONObject(packageDetailsJson);
//
//        System.out.println("json print\n"+jsonObject.toString());

    }

    public JSONArray getInstances(List<String> cmsIds) {

        JSONArray jsonArray = new JSONArray();

        for (String cmsId: cmsIds) {
            jsonArray.add(this.getInstances(cmsId));
        }

        return jsonArray;
    }

}

