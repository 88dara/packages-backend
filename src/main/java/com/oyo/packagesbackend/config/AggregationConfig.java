package com.oyo.packagesbackend.config;

import com.oyo.aggregation.packages.TPackageAggregationService;
import org.apache.thrift.protocol.TJSONProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.THttpClient;
import org.apache.thrift.transport.TTransportException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AggregationConfig {

    private static final Logger logger = LoggerFactory.getLogger(AggregationConfig.class);

    private static int port = 5000;
    private static String host = "localhost";
    private static String uri = "aggregation/";

    @Bean
    public TPackageAggregationService.Client commClientBuilder() throws Exception{
        return getCommClient().getThriftClient();
    }

    public ThriftClient<TPackageAggregationService.Client> getCommClient() {

        logger.debug("Opening a new package aggregation service connection");

        THttpClient httpClient = null;
        try {

//            httpClient = new THttpClient("http://" + host  + "/" + uri);
        httpClient = new THttpClient("http://" + host + ":" + port + "/" + uri);

            httpClient.setConnectTimeout(3000);

        } catch (TTransportException e) {
            logger.error("PackageDetails aggregation service  client exception : Transport exception " + e.getMessage());
        }

        TProtocol protocol = new TJSONProtocol(httpClient);
        return new ThriftClient<>(httpClient, new TPackageAggregationService.Client(protocol));
    }

    public void closeConnection(ThriftClient thriftClient) {
        thriftClient.getHttpClient().close();
        logger.debug("PackageDetails aggregation service connection successfully closed");
    }
}
